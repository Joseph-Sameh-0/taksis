import 'dart:async';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class ImageCardCarousel extends StatefulWidget {
  final List<String> imageUrls;

  const ImageCardCarousel({Key? key, required this.imageUrls})
      : super(key: key);

  @override
  _ImageCardCarouselState createState() => _ImageCardCarouselState();
}

class _ImageCardCarouselState extends State<ImageCardCarousel> {
  int _currentPage = 0;
  late final PageController _pageController;
  late Timer _timer;

  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_currentPage < widget.imageUrls.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.imageUrls.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                final image = widget.imageUrls[index];
                return Card(
                  clipBehavior: Clip.antiAlias,
                  child: Stack(
                    children: [
                      Image.asset(
                        image,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 16),
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       const Text("50-40% OFF",
                      //           style: TextStyle(
                      //               color: Colors.white,
                      //               fontWeight: FontWeight.bold,
                      //               fontSize: 24)),
                      //       const SizedBox(height: 7),
                      //       const Text("Now in (product)",
                      //           style: TextStyle(color: Colors.white)),
                      //       const Text("All colours",
                      //           style: TextStyle(color: Colors.white)),
                      //       const SizedBox(height: 7),
                      //       OutlinedButton(
                      //         onPressed: () {},
                      //         style: OutlinedButton.styleFrom(
                      //             backgroundColor: Colors.transparent,
                      //             side: const BorderSide(color: Colors.white),
                      //             padding: const EdgeInsets.symmetric(
                      //                 horizontal: 20, vertical: 12),
                      //             textStyle: const TextStyle(fontSize: 16),
                      //             shape: RoundedRectangleBorder(
                      //               borderRadius: BorderRadius.circular(8),
                      //             )),
                      //         child: const Row(
                      //           mainAxisSize: MainAxisSize.min,
                      //           children: [
                      //             Text('Shop Now',
                      //                 style: TextStyle(color: Colors.white)),
                      //             SizedBox(width: 8),
                      //             Icon(Icons.arrow_forward,
                      //                 color: Colors.white),
                      //           ],
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                );
              },
            ),
          ),
          // const SizedBox(height: 16),
          GestureDetector(
            child: DotsIndicator(
              dotsCount: widget.imageUrls.length,
              position: _currentPage.toInt(),
              decorator: DotsDecorator(
                color: Colors.grey,
                // Inactive dot color
                activeColor: Colors.blue,
                // Active dot color
                size: const Size.square(15),
                // activeSize: const Size(18.0, 9.0),
                activeSize: const Size.square(15),
            
                // activeShape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(5.0),
                // ),
              ),
              onTap: (position) {
                setState(() {
                  _currentPage = position.toInt();
                });
                _pageController.animateToPage(
                  _currentPage,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),

          ),
        ],
      ),
    );
  }
}
