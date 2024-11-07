import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class ProductImages extends StatefulWidget {
  final List<String> imageUrls;

  const ProductImages({super.key, required this.imageUrls});

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int _currentPage = 0;
  late final PageController _pageController; // Add PageController

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage); // Initialize
  }

  @override
  void dispose() {
    _pageController.dispose(); // Dispose PageController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 300,
            child: PageView.builder(
              itemCount: widget.imageUrls.length,
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                final image = widget.imageUrls[index];
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        final TransformationController
                            transformationController =
                            TransformationController();
                        return Dialog(
                          insetPadding: EdgeInsets.zero,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            onDoubleTap: () {
                              // Zoom in/out on double tap
                              final currentScale = transformationController
                                  .value
                                  .getMaxScaleOnAxis();
                              final newScale = currentScale == 1.0 ? 2.0 : 1.0;

                              final imageSize = context
                                  .size!; // Assuming the InteractiveViewer takes the full screen size
                              final centerX = imageSize.width / 2;
                              final centerY = imageSize.height / 2;

                              // Create a new Matrix4 with translation and scale
                              final newMatrix = Matrix4.identity()
                                ..translate(
                                    centerX, centerY) // Translate to the center
                                ..scale(newScale) // Apply scale
                                ..translate(-centerX,
                                    -centerY); // Translate back to the origin

                              transformationController.value = newMatrix;
                            },
                            child: InteractiveViewer(
                              transformationController:
                                  transformationController,
                              child: Image.asset(
                                widget.imageUrls[index],
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      image,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          DotsIndicator(
            dotsCount: widget.imageUrls.length,
            position: _currentPage.toInt(),
            decorator: DotsDecorator(
              color: Colors.grey,
              // Inactive dot color
              activeColor: Colors.blue,
              // Active dot color
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            onTap: (position) {
              setState(() {
                _currentPage = position.toInt();
                _pageController.animateToPage(
                  // Add this line
                  _currentPage, duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              });
            },
          ),
        ],
      ),
    );
  }
}
