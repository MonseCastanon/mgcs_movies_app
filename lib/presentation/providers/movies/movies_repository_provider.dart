import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mgcs_movies_app/infrastructure/infrastucture.dart';

final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl( MoviedbDatasourceImpl());
});