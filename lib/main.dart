import 'package:flutter/material.dart';
import 'package:mgcs_movies_app/config/theme/app_theme.dart';
import 'package:mgcs_movies_app/presentation/screens/movies/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  // animated_do, card_swiper, dio, flutter_dotenv, flutter_riverpod, go_router, youtube_player_flutter

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}
