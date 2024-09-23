import 'dart:convert';

// Model class for Restaurant
class RestaurantModel {
  final String? id;
  final String title;
  final String time;
  final String imageUrl;
  final String owner;
  final String code;
  final String logoUrl;
  final bool pickup;
  final bool delivery;
  final bool isAvailable;
  final double rating;
  final int ratingCount;
  final Coordinates coords;

  RestaurantModel({
    this.id,
    required this.title,
    required this.time,
    required this.imageUrl,
    required this.owner,
    required this.code,
    required this.logoUrl,
    required this.pickup,
    required this.delivery,
    required this.isAvailable,
    required this.rating,
    required this.ratingCount,
    required this.coords,
  });

  // Factory constructor to create a RestaurantModel from JSON
  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['_id']?.toString(),
      title: json['title']?.toString() ?? '',
      time: json['time']?.toString() ?? '',
      imageUrl: json['imageUrl']?.toString() ?? '',
      owner: json['owner']?.toString() ?? '',
      code: json['code']?.toString() ?? '',
      logoUrl: json['logoUrl']?.toString() ?? '',
      pickup: json['pickup'] ?? false,
      delivery: json['delivery'] ?? false,
      isAvailable: json['isAvailable'] ?? false,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      ratingCount: json['ratingCount'] ?? 0,
      coords: Coordinates.fromJson(json['coords'] ?? {}),
    );
  }

  // Method to convert RestaurantModel to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'time': time,
      'imageUrl': imageUrl,
      'owner': owner,
      'code': code,
      'logoUrl': logoUrl,
      'pickup': pickup,
      'delivery': delivery,
      'isAvailable': isAvailable,
      'rating': rating,
      'ratingCount': ratingCount,
      'coords': coords.toJson(),
    };
  }
}

// Model class for Coordinates
class Coordinates {
  final String id;
  final double latitude;
  final double longitude;
  final String address;
  final String title;
  final double latitudeDelta;
  final double longitudeDelta;

  Coordinates({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.title,
    required this.latitudeDelta,
    required this.longitudeDelta,
  });

  // Factory constructor to create Coordinates from JSON
  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      id: json['id']?.toString() ?? '',
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
      address: json['address']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      latitudeDelta: (json['latitudeDelta'] as num?)?.toDouble() ?? 0.0,
      longitudeDelta: (json['longitudeDelta'] as num?)?.toDouble() ?? 0.0,
    );
  }

  // Method to convert Coordinates to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
      'title': title,
      'latitudeDelta': latitudeDelta,
      'longitudeDelta': longitudeDelta,
    };
  }
}

// Function to parse a JSON string to a RestaurantModel
RestaurantModel restaurantModelFromJson(String str) {
  try {
    final Map<String, dynamic> jsonData = json.decode(str);
    return RestaurantModel.fromJson(jsonData);
  } catch (e) {
    throw FormatException('Error parsing RestaurantModel from JSON string: $e');
  }
}

// Function to parse a list of JSON strings to a List of RestaurantModel
List<RestaurantModel> restaurantModelListFromJson(String str) {
  try {
    final List<dynamic> jsonData = json.decode(str);
    return List<RestaurantModel>.from(
        jsonData.map((x) => RestaurantModel.fromJson(x as Map<String, dynamic>))
    );
  } catch (e) {
    throw FormatException('Error parsing list of RestaurantModels from JSON string: $e');
  }
}