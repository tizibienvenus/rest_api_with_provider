import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rest_api_with_provider/get_it.dart';
import 'package:rest_api_with_provider/home.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetItService.initializeService();
  runApp(
    ProviderScope(
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
