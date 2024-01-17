import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_hotel/presentation/resources/app_assets.dart';
import 'package:test_hotel/presentation/resources/app_strings.dart';
import 'package:test_hotel/presentation/widgets/room_data.dart';
import '../../api/api_service.dart';
import '../../logic/room_bloc/room_bloc.dart';
import '../../logic/room_bloc/room_event.dart';
import '../../logic/room_bloc/room_state.dart';
import '../resources/app_colors.dart';
import '../resources/app_text_styles.dart';
import '../widgets/common/image_carousel.dart';

class RoomsScreen extends StatelessWidget {
  final String? title;

  const RoomsScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          title == null ? AppStrings.hotel : title!,
          style: AppTextStyles.black18,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(AppAssets.vectorLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            RoomBloc(apiService: ApiService(Dio()))..add(FetchRoomEvent()),
        child: BlocBuilder<RoomBloc, RoomState>(
          builder: (context, state) {
            if (state is RoomLoading) {
              return const Center(
                child: CupertinoActivityIndicator(
                  color: AppColors.gray,
                ),
              );
            } else if (state is RoomLoaded) {
              return ListView.builder(
                itemCount: state.room.length,
                itemBuilder: (context, index) {
                  final room = state.room[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Column(children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(15),
                          ),
                        ),
                        child: ImageCarousel(imageUrls: room.imageUrls),
                      ),
                      RoomData(
                        name: room.name,
                        peculiarities: room.peculiarities,
                        price: room.price,
                        pricePer: room.pricePer,
                      )
                    ]),
                  );
                },
              );
            } else if (state is RoomError) {
              return const Center(child: Text(AppStrings.failedData));
            }
            return const Center(
              child: CupertinoActivityIndicator(
                color: AppColors.gray,
              ),
            );
          },
        ),
      ),
    );
  }
}
