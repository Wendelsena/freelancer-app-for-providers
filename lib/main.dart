import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'features/auth/presentation/screens/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FreelancerApp());
}

class FreelancerApp extends StatelessWidget {
  const FreelancerApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Freelancer App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      // Rota inicial como tela de cadastro (altere para LoginScreen se preferir)
      home: SignupScreen(),
      routes: {
        '/signup': (context) => SignupScreen(),
      },
    );
  }
}
