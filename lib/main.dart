import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'services/gpt_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ZynixOS());
}

class ZynixOS extends StatelessWidget {
  const ZynixOS({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GPTService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Zynix OS',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
          textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.white)),
          appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
