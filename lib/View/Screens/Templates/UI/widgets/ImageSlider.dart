import 'dart:async';
import 'package:gradution_project/Core/Imports/common_imports.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final PageController _controller = PageController();
  final List<String> images = [
    'assets/images/1ab471030b838de8779c72071bcdc281.png',
    'assets/images/1ab471030b838de8779c72071bcdc281.png',
    'assets/images/1ab471030b838de8779c72071bcdc281.png',
    'assets/images/1ab471030b838de8779c72071bcdc281.png',
    'assets/images/1ab471030b838de8779c72071bcdc281.png',
    'assets/images/1ab471030b838de8779c72071bcdc281.png',
  ];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_controller.hasClients) {
        int nextPage = (_currentIndex + 1) % images.length;
        _controller.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(images.length, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: _currentIndex == index ? 12 : 8,
          height: 8,
          decoration: BoxDecoration(
            gradient: _currentIndex == index
                ? ColorsClass.appGradient
                : ColorsClass.softGreyGradient,
            //   color: _currentIndex == index ? Colors.blue : Colors.grey,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context) / 1.05,
      child: Column(
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: PageView.builder(
              controller: _controller,
              itemCount: images.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 200,
                      ),
                    ),
                    Positioned(
                      left: 16,
                      bottom: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Try Now ➜',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          _buildIndicator(),
        ],
      ),
    );
  }
}
