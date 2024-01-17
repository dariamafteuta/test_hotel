import 'package:equatable/equatable.dart';

import '../../data/models/hotel_model.dart';

abstract class HotelState extends Equatable {
  @override
  List<Object> get props => [];
}

class HotelInitial extends HotelState {}

class HotelLoading extends HotelState {}

class HotelLoaded extends HotelState {
  final Hotel hotel;

  HotelLoaded({required this.hotel});

  @override
  List<Object> get props => [hotel];
}

class HotelError extends HotelState {}
