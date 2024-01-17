import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:test_hotel/data/models/reservation_model.dart';

import '../data/models/hotel_model.dart';
import '../data/models/room_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://run.mocky.io")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/v3/d144777c-a67f-4e35-867a-cacc3b827473")
  Future<Hotel> fetchHotel();

  @GET("/v3/8b532701-709e-4194-a41c-1a903af00195")
  Future<List<Room>> fetchRooms();

  @GET("/v3/63866c74-d593-432c-af8e-f279d1a8d2ff")
  Future<List<Reservation>> fetchReservation();
}