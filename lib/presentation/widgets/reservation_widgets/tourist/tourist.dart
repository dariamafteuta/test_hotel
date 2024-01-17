import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_hotel/presentation/resources/app_assets.dart';
import 'package:test_hotel/presentation/resources/app_strings.dart';
import '../../../../utils/tourist_number.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_text_styles.dart';
import '../../common/constants.dart';
import 'custom_form_tourist.dart';

class Tourist extends StatefulWidget {
  final int touristNumber;

  const Tourist({super.key, required this.touristNumber});

  @override
  _TouristState createState() => _TouristState();
}

class _TouristState extends State<Tourist> with SingleTickerProviderStateMixin {
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  final _citizenshipController = TextEditingController();
  final _passportNumberController = TextEditingController();
  final _passportValidityPeriod = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isSearchSelected = false;
  bool isVisible = false;

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _dateOfBirthController.dispose();
    _citizenshipController.dispose();
    _passportNumberController.dispose();
    _passportValidityPeriod.dispose();
    super.dispose();
  }

  void _toggleVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: AppColors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  getTouristNumberText(widget.touristNumber),
                  style: AppTextStyles.black22,
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => _toggleVisibility(),
                  color: AppColors.blueBackground,
                  child: isVisible
                      ? SvgPicture.asset(
                          AppAssets.vectorTop,
                          colorFilter: const ColorFilter.mode(
                            AppColors.blue,
                            BlendMode.srcIn,
                          ),
                        )
                      : SvgPicture.asset(
                          AppAssets.vectorBottom,
                          colorFilter: const ColorFilter.mode(
                            AppColors.blue,
                            BlendMode.srcIn,
                          ),
                        ),
                ),
              ],
            ),
            sizeBoxH16,
            isVisible
                ? Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CustomFormTourist(
                          labelText: AppStrings.name,
                          keyboardType: TextInputType.name,
                          controller: _nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.enterName;
                            }
                            return null;
                          },
                        ),
                        sizeBoxH8,
                        CustomFormTourist(
                          labelText: AppStrings.surname,
                          keyboardType: TextInputType.name,
                          controller: _surnameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.enterSurname;
                            }
                            return null;
                          },
                        ),
                        sizeBoxH8,
                        CustomFormTourist(
                          labelText: AppStrings.dataB,
                          keyboardType: TextInputType.number,
                          controller: _dateOfBirthController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.enterData;
                            }
                            return null;
                          },
                        ),
                        sizeBoxH8,
                        CustomFormTourist(
                          labelText: AppStrings.citizenship,
                          keyboardType: TextInputType.text,
                          controller: _citizenshipController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.enterCitizenship;
                            }
                            return null;
                          },
                        ),
                        sizeBoxH8,
                        CustomFormTourist(
                            labelText: AppStrings.enterPassportNumber,
                            keyboardType: TextInputType.multiline,
                            controller: _passportNumberController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppStrings.enterPassportNumber;
                              }
                              return null;
                            }),
                        sizeBoxH8,
                        CustomFormTourist(
                          labelText: AppStrings.passportValidity,
                          keyboardType: TextInputType.multiline,
                          controller: _passportValidityPeriod,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.enterPassportValidity;
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
