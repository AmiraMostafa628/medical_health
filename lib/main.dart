import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:medical_health_clean_arch/core/shared_function/initial_orders.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/app_layout/medical_health_app.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/home_view.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/welcome/view/welcome_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  try {
    await Firebase.initializeApp();
  } catch (e) {
    if (kDebugMode) {
      print('Error initializing Firebase: $e');
    }
  }
  Widget startWidget = await getInitialOrders() ? HomeView() : WelcomeView();

  runApp(MedicalHealthApp(startWidget: startWidget));
}
