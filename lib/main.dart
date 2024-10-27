import 'package:flutter/material.dart';
import 'package:uts_anon/screen/contact_page.dart';
import 'package:uts_anon/screen/login_page.dart';
import 'package:uts_anon/service/appwrite.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AppwriteService _appwriteService = AppwriteService();

  @override
  void initState() {
    super.initState();
    _checkUserAccount();
  }

  Future<void> _checkUserAccount() async {
    try {
      final userAccount = await _appwriteService.account.get();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const ContactPage()),
      );
    } catch (e) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
