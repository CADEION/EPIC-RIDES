import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:epic_rides/dependency_injection.dart';
import 'package:epic_rides/firebase_options.dart';
import 'package:epic_rides/presentation/bloc/car_bloc.dart';
import 'package:epic_rides/presentation/screens/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CarBloc>()..add(LoadCars()),
      child: MaterialApp(
        home: OnboardingScreen(),
      ),
    );
  }
}
