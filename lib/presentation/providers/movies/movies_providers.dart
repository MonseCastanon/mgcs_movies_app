import 'package:flutter_riverpod/legacy.dart';
import 'package:mgcs_movies_app/domain/domain.dart';
import 'movies_repository_provider.dart';

final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider);
  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies.getNowPlaying
  );
});

typedef MovieCallback = Future<List<Movie>> Function({ int page });
class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  bool isLoading = false;
  MovieCallback fetchMoreMovies;

  MoviesNotifier({
    required this.fetchMoreMovies
  }) : super([]);
  
  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;

    currentPage++;

    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [ ...state, ...movies ];
    await Future.delayed(const Duration(milliseconds: 300));
    
    isLoading = false;
  }
}