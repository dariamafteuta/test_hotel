import 'package:flutter/cupertino.dart';

import '../../../resources/app_text_styles.dart';

class BookingDetail extends StatelessWidget {
  final String title;
  final String detail;

  const BookingDetail({Key? key, required this.title, required this.detail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              title,
              style: AppTextStyles.black16,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              detail,
              style: AppTextStyles.gray16,
            ),
          ),
        ],
      ),
    );
  }
}
