import 'package:equatable/equatable.dart';

import '../../data/models/reservation_model.dart';

abstract class ReservationState extends Equatable {
  @override
  List<Object> get props => [];
}

class ReservationInitial extends ReservationState {}

class ReservationLoading extends ReservationState {}

class ReservationLoaded extends ReservationState {
  final List<Reservation> reservation;

  ReservationLoaded({required this.reservation});

  @override
  List<Object> get props => [reservation];
}

class ReservationError extends ReservationState {
  final String message;
  ReservationError(this.message);

  @override
  List<Object> get props => [message];
}
