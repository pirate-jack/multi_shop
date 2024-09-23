import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'package:multi_shop/constants/constants.dart';
import 'package:multi_shop/models/api_error.dart';
import 'package:multi_shop/models/hook_model/hook_result.dart';
import 'package:multi_shop/models/restaurant.dart';

FetchHook useFetchAllRestaurant(String code) {
  final restaurant = useState<List<RestaurantModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = false;
    try {
      Uri url = Uri.parse('${appBaseUrl}/api/restaurant/all/$code');
      final response = await http.get(url);
      print(response.statusCode);

      if (response.statusCode == 200) {
        restaurant.value = restaurantModelListFromJson(response.body);
      } else {
        apiError.value = apiErrorFromJson(response.body);
      }
    } catch (e) {

      debugPrint("error :${e.toString()}");
      error.value = e as Exception;
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

  return FetchHook(
    data: restaurant.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
