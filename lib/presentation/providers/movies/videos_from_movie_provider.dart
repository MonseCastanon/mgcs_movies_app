import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:mgcs_movies_app/domain/entities/video.dart';
import 'package:mgcs_movies_app/presentation/providers/movies/movies_repository_provider.dart';

final FutureProviderFamily<List<Video>, String> videosFromMovieProvider =
    FutureProvider.family((ref, String movieId) {
      final movierepositoryProvider = ref.watch(movieRepositoryProvider);
      
      return movierepositoryProvider.getYoutubeVideoById(movieId);
    });