import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_hotel/logic/room_bloc/room_state.dart';

import '../../api/api_service.dart';
import 'room_event.dart';

class RoomBloc extends Bloc<RoomEvent, RoomState> {
  final ApiService apiService;

  RoomBloc({required this.apiService}) : super(RoomInitial()) {
    on<FetchRoomEvent>(_onFetchRoom);
  }

  void _onFetchRoom(FetchRoomEvent event, Emitter<RoomState> emit) async {
    emit(RoomLoading());
    try {
      final room = await apiService.fetchRooms();
      emit(RoomLoaded(room: room));
    } catch (e) {
      debugPrint(e.toString());
      emit(RoomError());
    }
  }
}
