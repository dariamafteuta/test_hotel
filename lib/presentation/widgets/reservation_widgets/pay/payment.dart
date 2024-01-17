import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_hotel/presentation/resources/app_colors.dart';
import 'package:test_hotel/presentation/resources/app_strings.dart';
import 'package:test_hotel/presentation/widgets/reservation_widgets/pay/payment_item.dart';

class Payment extends StatelessWidget {
  final int tour;
  final int fuelCharge;
  final int serviceCharge;
  final int total;

  const Payment(
      {super.key,
      required this.tour,
      required this.fuelCharge,
      required this.serviceCharge,
      required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PaymentItem(title: AppStrings.tour, amount: tour),
          PaymentItem(title: AppStrings.fuelCharge, amount: fuelCharge),
          PaymentItem(title: AppStrings.serviceCharge, amount: serviceCharge),
          PaymentItem(title: AppStrings.toPay, amount: total),
        ],
      ),
    );
  }
}
