import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_hotel/presentation/resources/app_strings.dart';
import 'package:test_hotel/presentation/resources/app_text_styles.dart';
import 'package:test_hotel/presentation/screens/proof_of_payment_screen.dart';
import 'package:test_hotel/presentation/widgets/reservation_widgets/buyer_information.dart';
import 'package:test_hotel/presentation/widgets/common/constants.dart';
import 'package:test_hotel/presentation/widgets/reservation_widgets/pay/payment.dart';
import 'package:test_hotel/presentation/widgets/reservation_widgets/tourist/tourist.dart';
import 'package:test_hotel/utils/formatters.dart';

import '../../api/api_service.dart';
import '../../logic/reservation_bloc/reservation_bloc.dart';
import '../../logic/reservation_bloc/reservation_event.dart';
import '../../logic/reservation_bloc/reservation_state.dart';
import '../resources/app_assets.dart';
import '../resources/app_colors.dart';
import '../widgets/common/button_select.dart';
import '../widgets/common/hotel_rating_and_address.dart';
import '../widgets/reservation_widgets/reservation_data/reservation_data.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  int touristsCount = 1;

  void _addNewTourist() {
    setState(() {
      touristsCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: const Text(
          AppStrings.reservation,
          style: AppTextStyles.black18,
        ),
        leading: IconButton(
          icon: SvgPicture.asset(AppAssets.vectorLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: BlocProvider(
        create: (context) => ReservationBloc(apiService: ApiService(Dio())),
        child: BlocBuilder<ReservationBloc, ReservationState>(
          builder: (context, state) {
            if (state is ReservationInitial) {
              context.read<ReservationBloc>().add(FetchReservationEvent());
              return const Center(
                child: CupertinoActivityIndicator(
                  color: AppColors.gray,
                ),
              );
            } else if (state is ReservationLoading) {
              return const Center(
                child: CupertinoActivityIndicator(
                  color: AppColors.gray,
                ),
              );
            } else if (state is ReservationLoaded) {
              int total = state.reservation.first.tourPrice +
                  state.reservation.first.fuelCharge +
                  state.reservation.first.serviceCharge;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ListView(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: AppColors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: HotelRatingAndAddress(
                          nameHotel: state.reservation.first.hotelName,
                          rating: state.reservation.first.hotelRating,
                          ratingName: state.reservation.first.ratingName,
                          address: state.reservation.first.hotelAddress,
                        ),
                      ),
                    ),
                    sizeBoxH8,
                    ReservationData(
                      departure: state.reservation.first.departure,
                      country: state.reservation.first.arrivalCountry,
                      tourDateStart: state.reservation.first.tourDateStart,
                      tourDateStop: state.reservation.first.tourDateStop,
                      numberOfNight: state.reservation.first.numberOfNights,
                      hotelName: state.reservation.first.hotelName,
                      room: state.reservation.first.room,
                      nutrition: state.reservation.first.nutrition,
                    ),
                    sizeBoxH8,
                    const BuyerInformation(),
                    for (var i = 1; i <= touristsCount; i++)
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Tourist(
                          touristNumber: i,
                        ),
                      ),
                    sizeBoxH8,
                    _buildAddTourist(),
                    sizeBoxH8,
                    Payment(
                      fuelCharge: state.reservation.first.fuelCharge,
                      tour: state.reservation.first.tourPrice,
                      serviceCharge: state.reservation.first.serviceCharge,
                      total: total,
                    ),
                    sizeBoxH8,
                    ButtonSelect(
                      nameButton:
                          '${AppStrings.pay} ${PriceFormatter.formatPrice(total)} ₽',
                      onButtonPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ProofOfPaymentScreen(),
                          ),
                        );
                      },
                      horizontal: 16,
                      vertical: 8,
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: Text(AppStrings.failedData),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildAddTourist() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: AppColors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              AppStrings.addTourist,
              style: AppTextStyles.black22,
            ),
            CupertinoButton(
              padding: EdgeInsets.zero,
              color: AppColors.blueBackground,
              onPressed: _addNewTourist,
              child: const Icon(
                Icons.add,
                color: AppColors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
