import 'package:get/instance_manager.dart';

abstract class BindsHelper {
  static T get<T extends Object>() {
    return Get.find<T>();
  }
}
