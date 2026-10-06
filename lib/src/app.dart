import 'package:flutter/material.dart';
import 'screens/home_shell.dart';

class DriverLedgerApp extends StatelessWidget {
  const DriverLedgerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DriverLedger',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF14532D)),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF6F7F8),
        cardTheme: const CardThemeData(elevation: 0, margin: EdgeInsets.zero),
      ),
      home: const HomeShell(),
    );
  }
}
