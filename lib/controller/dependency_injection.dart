import 'package:get/get.dart';
import 'package:mvvm_file_architecture/controller/network_controller.dart';

class DependencyInjection {
  static void init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}
