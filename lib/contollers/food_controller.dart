import 'package:get/get.dart';
import 'package:multi_shop/models/additives_obs.dart';
import 'package:multi_shop/models/food.dart';

class FoodController extends GetxController {
  RxInt currentPage = 0.obs;
  bool initialCheckedValue = false;
  var additivesList = <AdditiveObs>[].obs;

  void changePage(int index) {
    currentPage.value = index;
  }

  RxInt count = 1.obs;

  void increment() {
    count.value++;
  }

  void decrement() {
    if (count.value > 1) {
      count.value--;
    }
  }

  void loadAdditives(List<Additive> additives) {
    additivesList.clear();
    for (var additiveInfo in additives) {
      var additive = AdditiveObs(
          id: additiveInfo.id,
          title: additiveInfo.title,
          price: additiveInfo.price,
          checked: initialCheckedValue);
      if (additives.length == additivesList.length) {
      } else {
        additivesList.add(additive);
      }
    }
  }

  // List<String> getList() {
  //   List<String> ads = [];
  //   for (var additive in additivesList) {
  //     if (additive.isChecked.value && !ads.contains(additive.title)) {
  //       ads.add(additive.title);
  //     } else if (!additive.isChecked.value && ads.contains(additive.title)) {
  //       ads.remove(additive.title);
  //     }
  //   }
  //   return ads;
  // }

  RxDouble _totalPrice = 0.0.obs;
  double get additivePrice => _totalPrice.value;
  set setTotalPrice(double newPrice){
    _totalPrice.value = newPrice;
  }

  double getTotalPrice() {
    double totalPrice = 0.0;
    for (var additive in additivesList) {
      if (additive.isChecked.value) {
        totalPrice += double.tryParse(additive.price.toString()) ?? 0.0;
      }
    }
    setTotalPrice = totalPrice;
    return totalPrice;
  }
}
