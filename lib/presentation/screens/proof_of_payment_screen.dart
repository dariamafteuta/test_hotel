import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_hotel/presentation/resources/app_strings.dart';
import 'package:test_hotel/presentation/resources/app_text_styles.dart';
import 'package:test_hotel/presentation/screens/hotel_screen.dart';
import 'package:test_hotel/presentation/widgets/common/button_select.dart';
import 'package:test_hotel/presentation/widgets/common/constants.dart';

import '../../api/api_service.dart';
import '../../logic/hotel_bloc/hotel_bloc.dart';
import '../resources/app_assets.dart';
import '../resources/app_colors.dart';
import '../widgets/party_hat_icon.dart';

class ProofOfPaymentScreen extends StatelessWidget {
  const ProofOfPaymentScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text(
          AppStrings.orderPaid,
          style: AppTextStyles.black18,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(AppAssets.vectorLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          const Spacer(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PartyHatIcon(),
                sizeBoxH32,
                Center(
                    child: Text(
                  AppStrings.orderHasBeenProcessed,
                  style: AppTextStyles.black22,
                )),
                sizeBoxH20,
                Text(
                  AppStrings.confirmationOfAnOrder,
                  style: AppTextStyles.gray16,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const Spacer(),
          divider,
          ButtonSelect(
            nameButton: AppStrings.superr,
            onButtonPressed: () {
              Navigator.pushAndRemoveUntil<HotelScreen>(
                context,
                MaterialPageRoute<HotelScreen>(
                  builder: (_) => BlocProvider(
                    create: (_) => HotelBloc(apiService: ApiService(Dio())),
                    child: const HotelScreen(),
                  ),
                ),
                ModalRoute.withName('/hotel_screen'),
              );
            },
            horizontal: 16,
            vertical: 8,
          ),
        ],
      ),
    );
  }
}
