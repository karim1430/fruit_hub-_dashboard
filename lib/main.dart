import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/routing/app_router.dart';
import 'package:fruit_hub_dashboard/core/routing/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyBwh9OgAhPWX5yodtBsI1wB6BIiQkmDnqM',
      appId: '1:372393176344:android:53b492dfce89fff0bb026d',
      messagingSenderId: 'sendid',
      projectId: 'fruit-fe5e7',
      storageBucket: 'fruit-fe5e7.firebasestorage.app',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.root,
      onGenerateRoute: AppRouter().generateRoute,
    );
  }
}
