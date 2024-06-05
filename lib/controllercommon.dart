
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:olymetagame/Common.dart';
class HomePageControll extends GetxController with StateMixin {
  RxInt number = 0.obs;
  RxList<int> listnum = <int>[].obs;
  Random r = Random();

  void getNumber(AnimationController controller) async {
    change(null, status: RxStatus.loading());
    await controller.reverse();
    if (listnum.value.length == 90) {
      GetSnackBar(
        messageText: const Text(
          " Hết số gòi",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        isDismissible: true,
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 30,
        ),
        duration: const Duration(milliseconds: 2000),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.black.withOpacity(0.3),
      ).show();
      change(null, status: RxStatus.empty());
    } else {
      do {
        number.value = r.nextInt(90);
      } while (number.value == 0 ||
          listnum.where((p0) => p0 == number.value).isNotEmpty);
      listnum.value.add(number.value);
      await Future.delayed(const Duration(milliseconds: 800));
      change(null, status: RxStatus.success());
    }
    await controller.forward();
  }

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.loading());
  }

  void onNewGame() {
    listnum.value.clear();
    number.value = 0;
    change(null, status: RxStatus.loading());
  }

  void onViewList() {
    Get.to(() => const ListNumScreen(),
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
        transition: Transition.rightToLeftWithFade,
        arguments: listnum.value);
  }
}

// ignore_for_file: invalid_use_of_protected_member



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
