import 'package:flutter/material.dart';
import 'package:test_hotel/presentation/resources/app_strings.dart';

import 'booking_detail.dart';

class ReservationData extends StatelessWidget {
  final String departure;
  final String country;
  final String tourDateStart;
  final String tourDateStop;
  final int numberOfNight;
  final String hotelName;
  final String room;
  final String nutrition;

  const ReservationData(
      {Key? key,
      required this.departure,
      required this.country,
      required this.tourDateStart,
      required this.tourDateStop,
      required this.numberOfNight,
      required this.hotelName,
      required this.room,
      required this.nutrition})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BookingDetail(
            title: AppStrings.departure,
            detail: departure,
          ),
          BookingDetail(
            title: AppStrings.country,
            detail: country,
          ),
          BookingDetail(
            title: AppStrings.data,
            detail: '$tourDateStart - $tourDateStop',
          ),
          BookingDetail(
            title: AppStrings.numberOfNight,
            detail: '$numberOfNight',
          ),
          BookingDetail(
            title: AppStrings.hotel,
            detail: hotelName,
          ),
          BookingDetail(
            title: AppStrings.numberHotel,
            detail: room,
          ),
          BookingDetail(
            title: AppStrings.nutrition,
            detail: nutrition,
          ),
          // Add more details as necessary
        ],
      ),
    );
  }
}
