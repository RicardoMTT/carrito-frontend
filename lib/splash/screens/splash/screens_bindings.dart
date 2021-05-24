import 'package:get/get.dart';
import 'package:probardispositivofisico/splash/screens/splash/screen_controller.dart';

class SplashScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashScreenController());
  }
}
