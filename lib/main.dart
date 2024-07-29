import 'package:firebase_core/firebase_core.dart';
import 'package:loyalty_app/utils/custom_colors.dart';
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
  static final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return MaterialApp(
          title: 'Loyalty App',
          theme: ThemeData(
            useMaterial3: true,
            fontFamily: 'Poppins',
            colorScheme: CustomColors.lightmode,
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            fontFamily: 'Poppins',
            colorScheme: CustomColors.darkmode,
          ),
          themeMode: currentMode,
          debugShowCheckedModeBanner: false,
          home: AuthenticationService.handleAuthState(),
        );
      }
    );
  }
}