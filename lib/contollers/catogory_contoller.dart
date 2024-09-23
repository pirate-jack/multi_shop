import 'package:get/get.dart';

class CategoryController extends GetxController {
  final RxString _category = ''.obs;
  String get updateCategory => _category.value;
  set updateCategory(String value) {
    _category.value = value;
    print('Category updated: $updateCategory'); // Debug print
  }

  final RxString _title = ''.obs;
  String get updateTitle => _title.value;
  set updateTitle(String value) {
    _title.value = value;
    print('Title updated: $updateTitle'); // Debug print
  }
}
