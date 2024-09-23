import 'dart:ui';
import 'package:multi_shop/models/restaurant.dart';

class FetchHookRestaurant {
  late final RestaurantModel? data;
  final bool isLoading;
  final Exception? error;
  final VoidCallback? refetch;

  FetchHookRestaurant(
      {required this.data,
        required this.isLoading,
        required this.error,
        required this.refetch});
}
