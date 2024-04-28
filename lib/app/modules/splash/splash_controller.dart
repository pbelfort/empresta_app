import 'package:get/get.dart';

import '../../base/global_controller.dart';
import '../../routes/app_pages.dart';

class SplashController extends IGlobalController {
  @override
  Future<void> onReady() async {
    _loading();
    super.onReady();
  }

  _loading() async {
    await 2.5.delay();
    return Get.offAllNamed(Routes.HOME);
  }
}
