import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroments {
  static String theMovieDbKey = dotenv.env["MOVIEDB_KE"] ?? "No hay API key";
  static String apiUrl = dotenv.env["API_URL"] ?? "No hay URL";
  static String language = dotenv.env["LANGUAGE"] ?? "No hay idioma";
}