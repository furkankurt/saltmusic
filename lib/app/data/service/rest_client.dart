import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:salt_music/app/common/constants/api_constants.dart';
import 'package:salt_music/app/data/model/album_response.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET(ApiConstants.urlPath)
  Future<AlbumResponse> getTopAlbums();
}
