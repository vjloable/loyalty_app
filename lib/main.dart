import 'package:firebase_core/firebase_core.dart';
import 'features/authentication/application/authentication_service.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loyalty App',
      theme: ThemeData(fontFamily: 'Poppins', colorSchemeSeed: const Color(0xFF6590FF)),
      debugShowCheckedModeBanner: false,
      home: AuthenticationService.handleAuthState(),
    );
  }
}