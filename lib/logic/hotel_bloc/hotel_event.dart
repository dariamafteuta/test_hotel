import 'package:equatable/equatable.dart';

abstract class HotelEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchHotelEvent extends HotelEvent {}
