import 'dart:ui';

import 'package:multi_shop/models/food.dart';

class FetchHookFoods {
  late final List<FoodModel>? data;
  final bool isLoading;
  final Exception? error;
  final VoidCallback? refetch;

  FetchHookFoods(
      {required this.data,
        required this.isLoading,
        required this.error,
        required this.refetch});
}
