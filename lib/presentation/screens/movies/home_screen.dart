import 'package:flutter/material.dart';
import 'package:mgcs_movies_app/presentation/views/views.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeView(),
    );
  }
}
// git commit -m "init: Configuración del proyecto inicial"