import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:type_master/ad_halper.dart';
import 'package:type_master/presentation/screen/home/notifier/provider.dart';
import 'package:type_master/presentation/theme/appcolor.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  BannerAd? _bannerAd;
  Timer? _timer;
  int _timeElapsed = 0;
  bool _isRunning = false;
  int _currentWordIndex = 0;
  List<String> _words = [];
  List<bool?> _wordCorrectness = [];
  bool _currentWordWrong = false;
  bool _complete = false;

  @override
  void initState() {
    super.initState();
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, error) {
          print("error : $error");
          ad.dispose();
        },
      ),
    ).load();
  }

  void _startTimer() {
    if (_isRunning) return;
    _isRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _timeElapsed++;
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _isRunning = false;
    _complete = true;
  }

  void _resetTest(String quote) {
    if (quote.isEmpty) return;
    _stopTimer();
    _timeElapsed = 0;
    _controller.clear();
    _currentWordIndex = 0;
    _words = quote.split(' ');
    _wordCorrectness = List.filled(_words.length, null);
    _currentWordWrong = false;
    _complete = false;
    setState(() {});
    ref.read(homeNotifierProvider.notifier).refresh();
  }

  @override
  Widget build(BuildContext context) {
    final uiState = ref.watch(homeNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Type Master",
          style: TextStyle(color: AppColors.primarySubText),
        ),
        centerTitle: true,
        backgroundColor: AppColors.secondary,
        actions: [
          IconButton(
            onPressed: () {
              final quote = uiState.maybeWhen(
                success: (q) => q.quote,
                orElse: () => "",
              );
              _resetTest(quote);
            },
            icon: Icon(Icons.refresh, color: AppColors.primarySubText),
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: uiState.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error) => Center(child: Text("Error: $error")),
              success: (quote) {
                if (_words.isEmpty && quote.quote.isNotEmpty) {
                  _words = quote.quote.split(' ');
                  _wordCorrectness = List.filled(_words.length, null);
                }

                final isFinished = _currentWordIndex >= _words.length;

                final currentWord = (_words.isNotEmpty && !isFinished)
                    ? _words[_currentWordIndex]
                    : "";

                if (_words.isEmpty) {
                  return const Center(child: Text("No quote available."));
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Type the words:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryText,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8.r),
                      ),

                      padding: const EdgeInsets.all(8),
                      child: Wrap(
                        spacing: 6,
                        children: List.generate(_words.length, (index) {
                          Color color;
                          if (_wordCorrectness.length > index &&
                              _wordCorrectness[index] != null) {
                            color = (_wordCorrectness[index]!
                                ? Colors.green[300]
                                : AppColors.errorColor)!;
                          } else if (index == _currentWordIndex &&
                              !isFinished) {
                            color = _currentWordWrong
                                ? AppColors.errorColor
                                : AppColors.secondary;
                          } else {
                            color = AppColors.primarySubText;
                          }
                          return Text(
                            _words[index],
                            style: TextStyle(fontSize: 18.sp, color: color),
                          );
                        }),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    _complete
                        ? Center(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: AppColors.secondary,
                                foregroundColor: AppColors.buttonColor,
                                minimumSize: Size(double.infinity, 50.w),
                                textStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {
                                _resetTest(quote.quote);
                              },
                              child: Text("Try Again"),
                            ),
                          )
                        : TextField(
                            controller: _controller,
                            autofocus: true,
                            enabled: !isFinished,
                            style: const TextStyle(
                              color: AppColors.primaryText,
                            ),
                            onChanged: (value) {
                              if (_words.isEmpty || isFinished) return;

                              if (!_isRunning) _startTimer();

                              _currentWordWrong =
                                  currentWord.isNotEmpty &&
                                  !currentWord.startsWith(value.trim());
                              if (value.endsWith(' ') && !isFinished) {
                                final typedWord = value.trim();
                                _wordCorrectness[_currentWordIndex] =
                                    typedWord == currentWord;

                                _currentWordIndex++;
                                _controller.clear();
                                _currentWordWrong = false;

                                if (_currentWordIndex >= _words.length) {
                                  _stopTimer();
                                }
                              }

                              setState(() {});
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Type the current word...",
                              hintStyle: TextStyle(
                                color: AppColors.primarySubText,
                              ),
                            ),
                          ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Text(
                          "Time: $_timeElapsed s",
                          style: TextStyle(color: AppColors.secondary),
                        ),
                        Spacer(),
                        Text(
                          "WPM: ${((_wordCorrectness.where((e) => e == true).length) / (_timeElapsed / 60 + 0.01)).toInt()}",
                          style: TextStyle(color: AppColors.secondary),
                        ),
                        Spacer(),
                        Text(
                          "Accuracy: ${((_wordCorrectness.where((e) => e == true).length / (_currentWordIndex == 0 ? 1 : _currentWordIndex)) * 100).toStringAsFixed(2)}%",
                          style: TextStyle(color: AppColors.secondary),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
          if (_bannerAd != null)
            Align(
              alignment: AlignmentGeometry.bottomCenter,
              child: SizedBox(
                width: _bannerAd!.size.width.toDouble(),
                height: _bannerAd!.size.height.toDouble(),
                child: AdWidget(ad: _bannerAd!),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }
}
