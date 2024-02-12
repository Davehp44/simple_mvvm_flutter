import 'package:get/get.dart';
import 'package:mvvm_flutter/features/detail_user/controller/user_controller.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(UserController(), permanent: true);
  }
}
