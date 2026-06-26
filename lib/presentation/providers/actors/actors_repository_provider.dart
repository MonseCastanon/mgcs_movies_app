import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mgcs_movies_app/domain/domain.dart';
import 'package:mgcs_movies_app/infrastructure/infrastucture.dart';

final actorRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviedbDatasourceImpl());
});