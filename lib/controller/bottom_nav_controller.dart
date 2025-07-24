import 'package:get/get.dart';

class BottomNavController extends GetxController {
  final RxInt _page = 0.obs;

  // phương thức lấy ra page
  int get page => _page.value;

  //hàm đổi trang
  void swap(int index){
    _page.value = index;
  }
}
