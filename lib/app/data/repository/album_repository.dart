import 'package:salt_music/app/data/model/album_response.dart';
import 'package:salt_music/app/data/service/rest_client.dart';

class AlbumRepository {
  AlbumRepository(this.restClient);

  final RestClient restClient;

  Future<AlbumResponse> getTopAlbums() async {
    return restClient.getTopAlbums();
  }
}
