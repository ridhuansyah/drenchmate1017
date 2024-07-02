import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'infrastructure/network/firebase_options.dart';
import 'package:drenchmate_2024/presentation/screens/home_landing_page.dart';
import 'package:drenchmate_2024/presentation/screens/account_home_screen.dart';
import 'package:drenchmate_2024/presentation/screens/email_registration_page.dart';
import 'package:drenchmate_2024/presentation/screens/drench_entry_screen.dart'; //RS20240628
import 'package:drenchmate_2024/presentation/screens/chemical_entry_screen.dart';
import 'package:provider/provider.dart';
import 'package:drenchmate_2024/business_logic/models/chemical_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const DrenchMateApp());
}

class DrenchMateApp extends StatelessWidget {
  const DrenchMateApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChemicalProvider()..fetchChemicals()),
      ],
      child: MaterialApp(
        title: 'DrenchMate',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: HomePage.id,
        routes: {
          HomePage.id: (context) => const HomePage(),
          RegistrationPage.id: (context) => const RegistrationPage(),
          AccountHomeScreen.id: (context) => const AccountHomeScreen(),
          DrenchEntryScreen.id: (context) => const DrenchEntryScreen(), //RS20240628
          ChemicalEntryScreen.id: (context) => const ChemicalEntryScreen(),
        },
      ),
    );
  }
}
