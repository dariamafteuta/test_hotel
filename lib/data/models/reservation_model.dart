class Reservation {
  final int id;
  final String hotelName;
  final String hotelAddress;
  final double hotelRating;
  final String ratingName;
  final String departure;
  final String arrivalCountry;
  final String tourDateStart;
  final String tourDateStop;
  final int numberOfNights;
  final String room;
  final String nutrition;
  final int tourPrice;
  final int fuelCharge;
  final int serviceCharge;

  Reservation({
    required this.id,
    required this.hotelName,
    required this.hotelAddress,
    required this.hotelRating,
    required this.ratingName,
    required this.departure,
    required this.arrivalCountry,
    required this.tourDateStart,
    required this.tourDateStop,
    required this.numberOfNights,
    required this.room,
    required this.nutrition,
    required this.tourPrice,
    required this.fuelCharge,
    required this.serviceCharge,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      id: json['id'] as int,
      hotelName: json['hotel_name'] as String,
      hotelAddress: json['hotel_adress'] as String,
      hotelRating: (json['horating'] as num).toDouble(),
      ratingName: json['rating_name'] as String,
      departure: json['departure']as String,
      arrivalCountry: json['arrival_country'] as String,
      tourDateStart: json['tour_date_start'] as String,
      tourDateStop: json['tour_date_stop'] as String,
      numberOfNights: json['number_of_nights'] as int,
      room: json['room'] as String,
      nutrition: json['nutrition'] as String,
      tourPrice: json['tour_price'] as int,
      fuelCharge: json['fuel_charge'] as int,
      serviceCharge: json['service_charge'] as int,
    );
  }
}
