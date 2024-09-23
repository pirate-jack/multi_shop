import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:multi_shop/constants/constants.dart';
import 'package:multi_shop/contollers/catogory_contoller.dart';
import 'package:multi_shop/models/api_error.dart';
import 'package:multi_shop/models/food.dart';
import 'package:multi_shop/models/hook_model/hook_food_result.dart';


FetchHookFoods useFetchFoodsByCategory(String code) {
  final controller = Get.put(CategoryController());
  final foods = useState<List<FoodModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);
  Future<void> fetchData() async {
    isLoading.value = true;
    error.value = null;
    try {
      Uri url = Uri.parse('${appBaseUrl}/api/foods/${controller.updateCategory}/$code');
      print("Url :${url.toString()}");
      final response = await http.get(url);
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        foods.value = foodItemFromJson(response.body);
      } else {
        apiError.value = apiErrorFromJson(response.body);
      }
    } catch (e) {
      error.value = Exception('An error occurred: ${e.toString()}');
      debugPrint("error: ${error.value}");
    } finally {
      isLoading.value = false;
    }
  }
  useEffect(() {
    fetchData();
    return null;
  }, [controller.updateCategory]);

  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchHookFoods(
    data: foods.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
