import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'package:multi_shop/constants/constants.dart';
import 'package:multi_shop/models/api_error.dart';
import 'package:multi_shop/models/food.dart';
import 'package:multi_shop/models/hook_model/hook_food_result.dart';


FetchHookFoods useFetchFoods(String code) {
  final foods = useState<List<FoodModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = false;
    try {
      Uri url = Uri.parse('${appBaseUrl}/api/foods/recommendation/$code');
      final response = await http.get(url);
      // print(response.statusCode);
      // print(response.body);
      if (response.statusCode == 200) {
        foods.value = foodItemFromJson(response.body);
      } else {
        apiError.value = apiErrorFromJson(response.body);
      }
    } catch (e) {
     error.value = e as Exception;
      debugPrint("error :${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, []);

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
