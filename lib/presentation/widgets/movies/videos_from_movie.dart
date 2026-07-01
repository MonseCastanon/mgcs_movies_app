import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mgcs_movies_app/domain/domain.dart';
import 'package:mgcs_movies_app/presentation/providers/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideosFromMovie extends ConsumerWidget {

  final String movieId;

  const VideosFromMovie({
    super.key,
    required this.movieId
    });

  @override
  Widget build(BuildContext context, ref) {

    final moviesFromVideos = ref.watch(videosFromMovieProvider(movieId));
    return moviesFromVideos.when(
      data: ( videos ) => _VideoList(videos: videos),
      error: (_, _) => Center(child: Text('No pudo cargar los videos'),),
      loading: () => Center(child: CircularProgressIndicator(strokeWidth: 2))
    );
  }
}

class _VideoList extends StatelessWidget {

  final List<Video> videos;
  
  const _VideoList({
    required this.videos
  });

  @override
  Widget build(BuildContext context) {

    // Si no existen videos
    if ( videos.isEmpty ) return const SizedBox.shrink();

    return _YoutubeVideoPlayer(youtubeId: videos.first.youtubeKey, name: videos.first.name);
  }
}

class _YoutubeVideoPlayer extends StatefulWidget {

  final String youtubeId;
  final String name;
  
  const _YoutubeVideoPlayer({
    required this.youtubeId,
    required this.name
  });

  @override
  State<_YoutubeVideoPlayer> createState() => _YoutubeVideoPlayerState();
}

class _YoutubeVideoPlayerState extends State<_YoutubeVideoPlayer> {
  
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController.fromVideoId(
      videoId: widget.youtubeId,
      autoPlay: true,
      params: YoutubePlayerParams(
        enableCaption: true,
        showFullscreenButton: false,
        mute: true,
        showControls: false
      )
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.name),
          YoutubePlayer(controller: _controller)
        ],
      ),
    );
  }
}