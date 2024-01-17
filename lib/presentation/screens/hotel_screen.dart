import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_hotel/logic/hotel_bloc/hotel_event.dart';
import 'package:test_hotel/presentation/resources/app_strings.dart';
import 'package:test_hotel/presentation/resources/app_text_styles.dart';
import 'package:test_hotel/presentation/screens/rooms_screen.dart';
import 'package:test_hotel/presentation/widgets/common/button_select.dart';
import 'package:test_hotel/presentation/widgets/common/constants.dart';
import 'package:test_hotel/presentation/widgets/hotel_widgets/hotel_basic_data.dart';
import 'package:test_hotel/presentation/widgets/hotel_widgets/hotel_detailed_data.dart';

import '../../logic/hotel_bloc/hotel_bloc.dart';
import '../../logic/hotel_bloc/hotel_state.dart';
import '../resources/app_colors.dart';
import '../widgets/common/image_carousel.dart';

class HotelScreen extends StatelessWidget {
  const HotelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: const Text(
          AppStrings.hotel,
          style: AppTextStyles.black18,
        ),
        elevation: 0.0,
      ),
      body: BlocBuilder<HotelBloc, HotelState>(
          builder: (_, state) {if (state is HotelInitial) {
            context.read<HotelBloc>().add(FetchHotelEvent());
            return const Center(
              child: CupertinoActivityIndicator(
                color: AppColors.gray,
              ),
            );
          } else if (state is HotelLoading) {
              return const Center(
                child: CupertinoActivityIndicator(
                  color: AppColors.gray,
                ),
              );
            } else if (state is HotelLoaded) {
              return ListView(
                children: [
                  Container(
                    color: AppColors.white,
                    child: ImageCarousel(
                      imageUrls: state.hotel.imageUrls,
                    ),
                  ),
                  HotelBasicData(
                    name: state.hotel.name,
                    address: state.hotel.address,
                    minimalPrice: state.hotel.minimalPrice,
                    priceForIt: state.hotel.priceForIt,
                    rating: state.hotel.rating,
                    ratingName: state.hotel.ratingName,
                  ),
                  sizeBoxH10,
                  HotelDetailedData(
                    description: state.hotel.description,
                    peculiarities: state.hotel.peculiarities,
                  ),
                  sizeBoxH10,
                  divider,
                  ButtonSelect(
                    onButtonPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RoomsScreen(title: state.hotel.name),
                        ),
                      );
                    },
                    nameButton: AppStrings.selectRoom,
                    horizontal: 16,
                    vertical: 8,
                  ),
                ],
              );
            } else {
              return const Center(
                child: Text(AppStrings.failedData),
              );
            }
          },
        ),
    );
  }
}
