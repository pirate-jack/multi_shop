import 'dart:convert';

class FoodModel {
  final String id;
  final String title;
  final String time;
  final List<String> foodTags;
  final String category;
  final List<String> foodType;
  final String code;
  final bool isAvailable;
  final String restaurant;
  final double rating;
  final int ratingCount;
  final String description;
  final double price;
  final List<Additive> additives;
  final List<String> imageUrl;

  FoodModel({
    required this.id,
    required this.title,
    required this.time,
    required this.foodTags,
    required this.category,
    required this.foodType,
    required this.code,
    required this.isAvailable,
    required this.restaurant,
    required this.rating,
    required this.ratingCount,
    required this.description,
    required this.price,
    required this.additives,
    required this.imageUrl,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      id: json['_id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      time: json['time']?.toString() ?? '',
      foodTags: List<String>.from(json['foodTags']?.map((x) => x.toString()) ?? []),
      category: json['category']?.toString() ?? '',
      foodType: List<String>.from(json['foodType']?.map((x) => x.toString()) ?? []),
      code: json['code']?.toString() ?? '',
      isAvailable: json['isAvailable'] ?? false,
      restaurant: json['restaurant']?.toString() ?? '',
      rating: _jsonToDouble(json['rating']),
      ratingCount: _jsonToInt(json['ratingCount']),
      description: json['description']?.toString() ?? '',
      price: _jsonToDouble(json['price']),
      additives: List<Additive>.from(json['additives']?.map((x) => Additive.fromJson(x)) ?? []),
      imageUrl: List<String>.from(json['imageUrl'] ?? []),
    );
  }

  static double _jsonToDouble(dynamic value) {
    if (value is String) {
      return double.tryParse(value) ?? 0.0;
    } else if (value is num) {
      return value.toDouble();
    }
    return 0.0;
  }

  static int _jsonToInt(dynamic value) {
    if (value is String) {
      return int.tryParse(value) ?? 0;
    } else if (value is num) {
      return value.toInt();
    }
    return 0;
  }
}

class Additive {
  final int id;
  final String title;
  final double price;

  Additive({
    required this.id,
    required this.title,
    required this.price,
  });


  factory Additive.fromJson(Map<String, dynamic> json) {
    return Additive(
      id: _jsonToInt(json['id']),
      title: json['title']?.toString() ?? '',
      price: _jsonToDouble(json['price']),
    );
  }


  static double _jsonToDouble(dynamic value) {
    if (value is String) {
      return double.tryParse(value) ?? 0.0;
    } else if (value is num) {
      return value.toDouble();
    }
    return 0.0;
  }

  static int _jsonToInt(dynamic value) {
    if (value is String) {
      return int.tryParse(value) ?? 0;
    } else if (value is num) {
      return value.toInt();
    }
    return 0;
  }
}

List<FoodModel> foodItemFromJson(String str) {
  final List<dynamic> jsonData = json.decode(str);
  return List<FoodModel>.from(jsonData.map((x) => FoodModel.fromJson(x)));
}
