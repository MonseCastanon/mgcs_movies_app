import 'package:mgcs_movies_app/domain/domain.dart';
import 'package:mgcs_movies_app/infrastructure/infrastucture.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
    id: cast.id,
    name: cast.name,
    profilePath: cast.profilePath.isNotEmpty
        ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
        : 'https://cdn.pixabay.com/photo/2023/02/18/11/00/icon-7797704_1280.png',
    character: cast.character,
  );
}
