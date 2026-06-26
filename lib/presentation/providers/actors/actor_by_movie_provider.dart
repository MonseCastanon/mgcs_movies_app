import 'package:flutter_riverpod/legacy.dart';
import 'package:mgcs_movies_app/domain/domain.dart';
import 'package:mgcs_movies_app/presentation/providers/provider.dart';

// State
final actorsByMovieProvider = StateNotifierProvider((ref) {
  final actorRepository = ref.watch(actorRepositoryProvider);

  return ActorByMovieNotifier(getActors: actorRepository.getActorByMovie);
});

// Notifier

typedef GetActorsCallBack = Future<List<Actor>>Function(String moviedb);

class ActorByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {

  final GetActorsCallBack getActors;

  
  ActorByMovieNotifier({
    required this.getActors
  }): super({});

  Future<void> loadActors(String movieId) async {
    if(state[movieId] != null) return;

    final List<Actor> actors = await getActors(movieId);
    
    state = {...state, movieId: actors};
  }
}