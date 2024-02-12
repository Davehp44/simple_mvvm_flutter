import 'package:get/get.dart';
import 'package:mvvm_flutter/features/detail_user/viewmodel/user_view_model.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(UserViewModel(), permanent: true);
  }
}
