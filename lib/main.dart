import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:type_master/core/di.dart';
import 'package:type_master/presentation/screen/home/home_screen.dart';
import 'package:type_master/presentation/theme/appcolor.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Type Master',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.robotoMonoTextTheme(Theme.of(context).textTheme),
        scaffoldBackgroundColor: AppColors.primaryBG,
        useMaterial3: true,
      ),

      home: HomeScreen(),
    );
  }
}
