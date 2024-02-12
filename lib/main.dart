import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_flutter/core/bindings/global_bindings.dart';
import 'package:mvvm_flutter/features/detail_user/views/user_list.dart';

void main() {
  runApp(GetMaterialApp(
    home: const MyApp(),
    initialBinding: GlobalBindings(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const PersonListView();
  }
}
