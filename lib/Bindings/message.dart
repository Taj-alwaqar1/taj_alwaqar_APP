import 'package:get/get.dart';

import '../Controller/pagesController/messageController.dart';

class MessageDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessageController>(
      () => MessageController(), // Create the controller instance
    );
  }
}