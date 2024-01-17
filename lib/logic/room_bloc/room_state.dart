import 'package:equatable/equatable.dart';
import 'package:test_hotel/data/models/room_model.dart';

abstract class RoomState extends Equatable {
  @override
  List<Object> get props => [];
}

class RoomInitial extends RoomState {}

class RoomLoading extends RoomState {}

class RoomLoaded extends RoomState {
  final List<Room> room;

  RoomLoaded({required this.room});

  @override
  List<Object> get props => [room];
}

class RoomError extends RoomState {}
