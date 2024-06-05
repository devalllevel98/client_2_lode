// ignore_for_file: invalid_use_of_protected_member

import 'package:get/get.dart';

class ListNumControllers extends GetxController with StateMixin {
  RxList<int> listnum = <int>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() {
    change(null, status: RxStatus.loading());
    listnum.value = Get.arguments;
    if (listnum.value.isEmpty) {
      change(null, status: RxStatus.empty());
    } else {
      change(null, status: RxStatus.success());
    }
  }
}
