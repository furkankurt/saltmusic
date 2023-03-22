import 'package:flutter_test/flutter_test.dart';
import 'package:salt_music/app/modules/base/controllers/base_view_controller.dart';

void main() {
  late BaseViewController baseViewController;
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    baseViewController = BaseViewController();
  });

  test('should change the page to 1', () async {
    // act
    baseViewController.onInit();
    baseViewController.changePage(1);

    // assert
    expect(baseViewController.pageIndex.value, 1);
  });
}
