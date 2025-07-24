import 'package:get/get.dart';

class AppBarController extends GetxController {
  RxString title = 'Đặng Bá Nhất'.obs;

  void changeTitle(String newTitle) {
    title.value = newTitle;
  }
}
