class Hotel {
  final int id;
  final String name;
  final String address;
  final int minimalPrice;
  final String priceForIt;
  final double rating;
  final String ratingName;
  final List<String> imageUrls;
  final String description;
  final List<String> peculiarities;

  Hotel({
    required this.id,
    required this.name,
    required this.address,
    required this.minimalPrice,
    required this.priceForIt,
    required this.rating,
    required this.ratingName,
    required this.imageUrls,
    required this.description,
    required this.peculiarities,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      id: json['id'] as int,
      name: json['name'] as String,
      address: json['adress'] as String,
      minimalPrice: json['minimal_price'] as int,
      priceForIt: json['price_for_it'] as String,
      rating: (json['rating'] as num).toDouble(),
      ratingName: json['rating_name'] as String,
      imageUrls: List<String>.from(json['image_urls'] as List),
      description: json['about_the_hotel']['description'] as String,
      peculiarities:
          List<String>.from(json['about_the_hotel']['peculiarities'] as List),
    );
  }
}
