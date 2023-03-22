import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:salt_music/app/data/repository/album_repository.dart';
import 'package:salt_music/app/modules/home/controllers/home_controller.dart';

import '../../fixtures/fixture_reader.dart';
import 'home_controller_test.mocks.dart';

@GenerateMocks(
  [
    AlbumRepository,
  ],
)
void main() {
  late HomeController homeController;
  late AlbumRepository albumRepository;
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    albumRepository = MockAlbumRepository();
    homeController = HomeController(albumRepository);
  });

  test('should fetch top albums, fill the lists', () async {
    // arrange
    when(albumRepository.getTopAlbums()).thenAnswer(
      (_) async => Future.value(topAlbums()),
    );

    // act
    homeController.onInit();
    await homeController.getTopAlbums();

    // assert
    expect(homeController.topAlbums, isNotEmpty);
    expect(homeController.categoryList, isNotEmpty);
  });

  test('should show snackbar when connection timeout error', () async {
    // arrange
    when(albumRepository.getTopAlbums()).thenThrow(
      DioError(
          requestOptions: RequestOptions(path: ''),
          type: DioErrorType.connectTimeout),
    );

    // act
    await homeController.getTopAlbums();

    // assert
    expect(homeController.topAlbums, isEmpty);
    expect(homeController.categoryList, isEmpty);
    expect(homeController.errorMessage.value, 'connect_timeout_error'.tr);
  });

  test('should show snackbar when receive timeout error', () async {
    // arrange
    when(albumRepository.getTopAlbums()).thenThrow(
      DioError(
          requestOptions: RequestOptions(path: ''),
          type: DioErrorType.receiveTimeout),
    );

    // act
    await homeController.getTopAlbums();

    // assert
    expect(homeController.topAlbums, isEmpty);
    expect(homeController.categoryList, isEmpty);
    expect(homeController.errorMessage.value, 'receive_timeout_error'.tr);
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
    await homeController.getTopAlbums();

    // assert
    expect(homeController.topAlbums, isEmpty);
    expect(homeController.categoryList, isEmpty);
    expect(
      homeController.errorMessage.value,
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
    await homeController.getTopAlbums();

    // assert
    expect(homeController.topAlbums, isEmpty);
    expect(homeController.categoryList, isEmpty);
    expect(homeController.errorMessage.value, '');
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
    await homeController.getTopAlbums();

    // assert
    expect(homeController.topAlbums, isEmpty);
    expect(homeController.categoryList, isEmpty);
    expect(homeController.errorMessage.value, '');
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
    await homeController.getTopAlbums();

    // assert
    expect(homeController.topAlbums, isEmpty);
    expect(homeController.categoryList, isEmpty);
    expect(homeController.errorMessage.value, '');
  });
}
