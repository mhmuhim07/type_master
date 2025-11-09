import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:type_master/presentation/screen/home/notifier/provider.dart';
import 'package:type_master/presentation/theme/appcolor.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  Timer? _timer;
  int _timeElapsed = 0;
  bool _isRunning = false;
  int _currentWordIndex = 0;
  List<String> _words = [];
  List<bool?> _wordCorrectness = [];
  bool _currentWordWrong = false;

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
      body: Padding(
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
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
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
                      } else if (index == _currentWordIndex && !isFinished) {
                        color = _currentWordWrong
                            ? AppColors.errorColor
                            : AppColors.secondary;
                      } else {
                        color = AppColors.primarySubText;
                      }
                      return Text(
                        _words[index],
                        style: TextStyle(fontSize: 18, color: color),
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _controller,
                  autofocus: true,
                  enabled: !isFinished,
                  style: const TextStyle(color: AppColors.primaryText),
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
                    hintStyle: TextStyle(color: AppColors.primarySubText),
                  ),
                ),
                const SizedBox(height: 20),
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
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }
}
