import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_hotel/presentation/screens/hotel_screen.dart';

import 'api/api_service.dart';
import 'logic/hotel_bloc/hotel_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (_) => HotelBloc(apiService: ApiService(Dio())),
        child: const HotelScreen(),
      ),
    );
  }
}
