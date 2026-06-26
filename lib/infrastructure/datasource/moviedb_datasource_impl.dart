import 'package:dio/dio.dart';
import 'package:mgcs_movies_app/config/config.dart';
import 'package:mgcs_movies_app/domain/domain.dart';
import 'package:mgcs_movies_app/infrastructure/infrastucture.dart';
import 'package:mgcs_movies_app/infrastructure/mappers/movie_mapper.dart';
import 'package:mgcs_movies_app/infrastructure/models/moviedb/movidb_detail.dart';
import 'package:mgcs_movies_app/infrastructure/models/moviedb/moviedb_response.dart';

class MoviedbDatasourceImpl extends MoviesDatasource{

  final dio = Dio(BaseOptions(
    baseUrl: Enviroments.apiUrl,
    queryParameters: {
      "api_key": Enviroments.theMovieDbKey,
      "language": Enviroments.language
    }
  ));
  
  @override
  Future<List<Actor>> getActorByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');

    final credits = MovieDbCredits.fromJson(response.data);

    List<Actor> actors = credits.cast
    .map((cast) => ActorMapper.castToEntity(cast)).toList();
    return actors;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing',
    queryParameters: {
      'page': page
    });

    final moviesDbResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies = moviesDbResponse.results
      .map((movieDb) => MovieMapper.movieDbToEntity(movieDb))
      .toList();

    return movies;
  }

  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get('/movie/$id');
    
    if(response.statusCode != 200){
      throw Exception('Movie with id: $id not found');
    }
    
    final detail = MovieDbDetail.fromJson(response.data);
    final Movie movie = MovieMapper.movieDbDetailToEntity(detail);
    return movie;
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    // TODO: implement getPopular
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getSimilarMovie(String movieId) {
    // TODO: implement getSimilarMovie
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    // TODO: implement getTopRated
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    // TODO: implement getUpcoming
    throw UnimplementedError();
  }

  @override
  Future<List<dynamic>> getYoutubeVideoById(String movieId) {
    // TODO: implement getYoutubeVideoById
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> searchMovie(String query) {
    // TODO: implement searchMovie
    throw UnimplementedError();
  }

}