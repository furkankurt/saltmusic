import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:salt_music/app/data/repository/album_repository.dart';
import 'package:salt_music/app/modules/albums/controllers/albums_controller.dart';

import '../../fixtures/fixture_reader.dart';
import 'albums_controller_test.mocks.dart';

@GenerateMocks(
  [
    AlbumRepository,
  ],
)
void main() {
  late AlbumsController albumsController;
  late AlbumRepository albumRepository;
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    albumRepository = MockAlbumRepository();
    albumsController = AlbumsController(albumRepository);
    when(albumRepository.getTopAlbums()).thenAnswer(
      (_) async => Future.value(topAlbums()),
    );
  });

  test('should fetch top albums, fill the lists', () async {
    // act
    albumsController.onInit();
    await albumsController.getTopAlbums();

    // assert
    expect(albumsController.topAlbums, isNotEmpty);
    expect(albumsController.sortedTopAlbums, isNotEmpty);
  });

  test('should sort by name ascending', () async {
    // act
    albumsController.onInit();
    await albumsController.getTopAlbums();
    albumsController.selectSortType(SortType.nameAsc);

    // assert
    expect(albumsController.topAlbums, isNotEmpty);
  });

  test('should sort by name descending', () async {
    // act
    albumsController.onInit();
    await albumsController.getTopAlbums();
    albumsController.selectSortType(SortType.nameDesc);

    // assert
    expect(albumsController.topAlbums, isNotEmpty);
  });

  test('should sort by date ascending', () async {
    // act
    albumsController.onInit();
    await albumsController.getTopAlbums();
    albumsController.selectSortType(SortType.dateAsc);

    // assert
    expect(albumsController.topAlbums, isNotEmpty);
  });

  test('should sort by date descending', () async {
    // act
    albumsController.onInit();
    await albumsController.getTopAlbums();
    albumsController.selectSortType(SortType.dateDesc);

    // assert
    expect(albumsController.topAlbums, isNotEmpty);
  });

  test('should shuffle the list', () async {
    // act
    albumsController.onInit();
    await albumsController.getTopAlbums();
    albumsController.selectSortType(SortType.shuffle);

    // assert
    expect(albumsController.topAlbums, isNotEmpty);
  });

  test('should reset the list', () async {
    // act
    albumsController.onInit();
    await albumsController.getTopAlbums();
    albumsController.selectSortType(null);

    // assert
    expect(albumsController.topAlbums, isNotEmpty);
  });

  test('should show snackbar when connection timeout error', () async {
    // arrange
    when(albumRepository.getTopAlbums()).thenThrow(
      DioError(
          requestOptions: RequestOptions(path: ''),
          type: DioErrorType.connectTimeout),
    );

    // act
    await albumsController.getTopAlbums();

    // assert
    expect(albumsController.topAlbums, isEmpty);
    expect(albumsController.errorMessage.value, 'connect_timeout_error'.tr);
  });

  test('should show snackbar when receive timeout error', () async {
    // arrange
    when(albumRepository.getTopAlbums()).thenThrow(
      DioError(
          requestOptions: RequestOptions(path: ''),
          type: DioErrorType.receiveTimeout),
    );

    // act
    await albumsController.getTopAlbums();

    // assert
    expect(albumsController.topAlbums, isEmpty);
    expect(albumsController.errorMessage.value, 'receive_timeout_error'.tr);
  });
  test('should show snackbar when response error', () async {
    // arrange
    when(albumRepository.getTopAlbums()).thenThrow(
      DioError(
        requestOptions: RequestOptions(path: ''),
        type: DioErrorType.response,
        response: Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 404,
        ),
      ),
    );

    // act
    await albumsController.getTopAlbums();

    // assert
    expect(albumsController.topAlbums, isEmpty);
    expect(
      albumsController.errorMessage.value,
      'response_error'.trParams(
        {
          'status_code': 404.toString(),
        },
      ),
    );
  });

  test('should show snackbar when other error', () async {
    // arrange
    when(albumRepository.getTopAlbums()).thenThrow(
      DioError(
        requestOptions: RequestOptions(path: ''),
        response: Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 404,
        ),
      ),
    );

    // act
    await albumsController.getTopAlbums();

    // assert
    expect(albumsController.topAlbums, isEmpty);
    expect(albumsController.errorMessage.value, '');
  });

  test('should show snackbar when cancel error', () async {
    // arrange
    when(albumRepository.getTopAlbums()).thenThrow(
      DioError(
        requestOptions: RequestOptions(path: ''),
        type: DioErrorType.cancel,
        response: Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 404,
        ),
      ),
    );

    // act
    await albumsController.getTopAlbums();

    // assert
    expect(albumsController.topAlbums, isEmpty);
    expect(albumsController.errorMessage.value, '');
  });
  test('should show snackbar when sendTimeout error', () async {
    // arrange
    when(albumRepository.getTopAlbums()).thenThrow(
      DioError(
        requestOptions: RequestOptions(path: ''),
        type: DioErrorType.sendTimeout,
        response: Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 404,
        ),
      ),
    );

    // act
    await albumsController.getTopAlbums();

    // assert
    expect(albumsController.topAlbums, isEmpty);
    expect(albumsController.errorMessage.value, '');
  });
}
