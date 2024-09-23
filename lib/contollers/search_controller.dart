import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:multi_shop/constants/constants.dart';
import 'package:multi_shop/models/api_error.dart';
import 'package:multi_shop/models/food.dart';
import 'package:http/http.dart' as http;

class SearchFoodController extends GetxController {
  RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

 set setLoading(bool value) {
    _isLoading.value = value;
  }


  RxBool _isTriggered = false.obs;
  bool get isTriggered => _isTriggered.value;
  set isTriggered(bool value) {
    _isTriggered.value = value;
  }

  List<FoodModel>? searchResult;

  void searchFood(String key)async{
    setLoading = true;
    Uri url = Uri.parse("$appBaseUrl/api/foods/search/$key");

    try{
      var responce = await http.get(url);
      print(responce.statusCode);
      if(responce.statusCode == 200){
        searchResult = foodItemFromJson(responce.body);
        setLoading = false;

      }else{
        setLoading = false;
        var error = apiErrorFromJson(responce.body);
      }
    }catch(e){
      setLoading=false;
      debugPrint(e.toString());
    }
  }
}
