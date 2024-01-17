import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../api/api_service.dart';

import 'hotel_event.dart';
import 'hotel_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  final ApiService apiService;

  HotelBloc({required this.apiService}) : super(HotelInitial()) {
    on<FetchHotelEvent>(_onFetchHotel);
  }

  void _onFetchHotel(FetchHotelEvent event, Emitter<HotelState> emit) async {
    emit(HotelLoading());
    try {
      final hotel = await apiService.fetchHotel();
      emit(HotelLoaded(hotel: hotel));
    } catch (e) {
      debugPrint(e.toString());
      emit(HotelError());
    }
  }
}
