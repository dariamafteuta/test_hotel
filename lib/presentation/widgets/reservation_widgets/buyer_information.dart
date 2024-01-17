import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:test_hotel/presentation/resources/app_strings.dart';
import 'package:test_hotel/presentation/resources/app_text_styles.dart';
import 'package:test_hotel/presentation/widgets/common/constants.dart';
import 'package:test_hotel/presentation/widgets/common/custom_form_info.dart';

import '../../resources/app_colors.dart';

class BuyerInformation extends StatefulWidget {
  const BuyerInformation({super.key});

  @override
  _BuyerInformationState createState() => _BuyerInformationState();
}

class _BuyerInformationState extends State<BuyerInformation> {
  final _phoneController = MaskedTextController(mask: '+7 (000) 000-00-00');
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isSearchSelected = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
        color: AppColors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              AppStrings.buyerInfo,
              style: AppTextStyles.black22,
            ),
            sizeBoxH16,
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CustomFormInfo(
                      labelText: AppStrings.phone,
                      hintText: AppStrings.number,
                      keyboardType: TextInputType.phone,
                      controller: _phoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppStrings.enterNumberPhone;
                        }
                        return null;
                      }),
                  sizeBoxH8,
                  CustomFormInfo(
                    labelText: AppStrings.email,
                    hintText: AppStrings.emailExs,
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !EmailValidator.validate(value)) {
                        return AppStrings.enterEmail;
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            sizeBoxH8,
            const Text(
              AppStrings.info,
              style: AppTextStyles.gray14,
            ),
          ],
        ),
      ),
    );
  }
}
