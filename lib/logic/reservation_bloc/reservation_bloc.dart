import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_hotel/logic/reservation_bloc/reservation_event.dart';
import 'package:test_hotel/logic/reservation_bloc/reservation_state.dart';

import '../../api/api_service.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  final ApiService apiService;

  ReservationBloc({required this.apiService}) : super(ReservationInitial()) {
    on<FetchReservationEvent>(_onFetchReservation);
  }

  void _onFetchReservation(FetchReservationEvent event, Emitter<ReservationState> emit) async {
    emit(ReservationLoading());
    try {
      final reservation = await apiService.fetchReservation();
      emit(ReservationLoaded(reservation: reservation));
    } catch (e) {
      debugPrint(e.toString());
      emit(ReservationError(e.toString()));
    }
  }
}

