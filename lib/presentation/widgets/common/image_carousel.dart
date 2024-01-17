import 'package:flutter/cupertino.dart';
import 'package:test_hotel/presentation/resources/app_colors.dart';

class ImageCarousel extends StatefulWidget {
  final List<String> imageUrls;

  const ImageCarousel({
    Key? key,
    required this.imageUrls,
  }) : super(key: key);

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    int imageUrlsLength = widget.imageUrls.length;

    return Stack(
      children: [
        SizedBox(
          height: 257,
          width: double.infinity,
          child: PageView.builder(
            controller: _controller,
            onPageChanged: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            itemCount: imageUrlsLength,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  right: 16,
                  left: 16,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    widget.imageUrls[index],
                    loadingBuilder: (_, child, loadingProgress) =>
                        loadingProgress == null
                            ? child
                            : const CupertinoActivityIndicator(),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 5,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.white,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(imageUrlsLength, (index) {
                  int indexDifference = (index - _currentIndex).abs();
                  double opacity =
                      (1 - (imageUrlsLength / 10) * indexDifference)
                          .clamp(0.0, 1.0);
                  return Container(
                    width: 7,
                    height: 7,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.black.withOpacity(opacity),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
