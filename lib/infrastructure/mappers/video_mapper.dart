import 'package:mgcs_movies_app/domain/domain.dart';

import '../models/moviedb/moviedb_videos_response.dart';

class VideoMapper {
  static Video movieDbToEntity (Result video) => Video(
    id: video.id,
    name: video.name,
    youtubeKey: video.key,
    publishedAt: video.publishedAt
  );
}