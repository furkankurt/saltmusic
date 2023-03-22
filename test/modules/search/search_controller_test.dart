import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:salt_music/app/data/repository/album_repository.dart';
import 'package:salt_music/app/modules/search/controllers/search_controller.dart';

import '../../fixtures/fixture_reader.dart';
import 'search_controller_test.mocks.dart';

@GenerateMocks(
  [
    AlbumRepository,
  ],
)
void main() {
  late SearchController searchController;
  late AlbumRepository albumRepository;
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    albumRepository = MockAlbumRepository();
    searchController = SearchController(albumRepository);
  });

  test('should fetch top albums, fill the lists', () async {
    // arrange
    when(albumRepository.getTopAlbums()).thenAnswer(
      (_) async => Future.value(topAlbums()),
    );

    // act
    searchController.onInit();
    await searchController.getTopAlbums();

    // assert
    expect(searchController.topAlbums, isNotEmpty);
    expect(searchController.filteredTopAlbums, isNotEmpty);
  });

  test('should search with null', () async {
    // arrange
    when(albumRepository.getTopAlbums()).thenAnswer(
      (_) async => Future.value(topAlbums()),
    );

    // act
    searchController.onInit();
    await searchController.getTopAlbums();
    searchController.search(null);

    // assert
    expect(searchController.topAlbums, isNotEmpty);
    expect(searchController.filteredTopAlbums, searchController.topAlbums);
  });

  test('should search on filteredList', () async {
    // arrange
    when(albumRepository.getTopAlbums()).thenAnswer(
      (_) async => Future.value(topAlbums()),
    );

    // act
    searchController.onInit();
    await searchController.getTopAlbums();
    searchController.search('a');

    // assert
    expect(searchController.topAlbums, isNotEmpty);
    expect(
      searchController.filteredTopAlbums,
      searchController.topAlbums.where(
        (album) => album.name.toLowerCase().contains('a'),
      ),
    );
  });

  test('should clear controller and reset list', () async {
    // arrange
    when(albumRepository.getTopAlbums()).thenAnswer(
      (_) async => Future.value(topAlbums()),
    );

    // act
    searchController.onInit();
    await searchController.getTopAlbums();
    searchController.clear();

    // assert
    expect(searchController.topAlbums, isNotEmpty);
    expect(searchController.filteredTopAlbums, searchController.topAlbums);
  });

  test('should show snackbar when connection timeout error', () async {
    // arrange
    when(albumRepository.getTopAlbums()).thenThrow(
      DioError(
          requestOptions: RequestOptions(path: ''),
          type: DioErrorType.connectTimeout),
    );

    // act
    await searchController.getTopAlbums();

    // assert
    expect(searchController.topAlbums, isEmpty);
    expect(searchController.errorMessage.value, 'connect_timeout_error'.tr);
  });

  test('should show snackbar when receive timeout error', () async {
    // arrange
    when(albumRepository.getTopAlbums()).thenThrow(
      DioError(
          requestOptions: RequestOptions(path: ''),
          type: DioErrorType.receiveTimeout),
    );

    // act
    await searchController.getTopAlbums();

    // assert
    expect(searchController.topAlbums, isEmpty);
    expect(searchController.errorMessage.value, 'receive_timeout_error'.tr);
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
    await searchController.getTopAlbums();

    // assert
    expect(searchController.topAlbums, isEmpty);
    expect(
      searchController.errorMessage.value,
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
    await searchController.getTopAlbums();

    // assert
    expect(searchController.topAlbums, isEmpty);
    expect(searchController.errorMessage.value, '');
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
    await searchController.getTopAlbums();

    // assert
    expect(searchController.topAlbums, isEmpty);
    expect(searchController.errorMessage.value, '');
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
    await searchController.getTopAlbums();

    // assert
    expect(searchController.topAlbums, isEmpty);
    expect(searchController.errorMessage.value, '');
  });
}
