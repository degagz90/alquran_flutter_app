import 'package:get/get.dart';

import '../../../data/providers/quran_provider.dart';
import '../controllers/quran_controller.dart';

class QuranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuranController>(() => QuranController());
    Get.lazyPut<QuranProvider>(() => QuranProvider());
  }
}
