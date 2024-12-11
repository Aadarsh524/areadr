import 'package:flutter/material.dart';

class CustomCarousel extends StatefulWidget {
  final List<String> imagePaths;

  const CustomCarousel({
    super.key,
    required this.imagePaths,
  });

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  int _currentIndex = 0;

  // Method to build carousel image
  Widget buildCarouselImage(String imagePath) {
    return Container(
      height: 250, // Increased height for better visibility
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // Dots indicator for the carousel
  Widget buildDotsIndicator() {
    return DotsIndicator(
      currentIndex: _currentIndex,
      totalDots: widget.imagePaths.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Carousel: PageView to display images
        SizedBox(
          height: 300,
          child: PageView.builder(
            itemCount: widget.imagePaths.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return buildCarouselImage(widget.imagePaths[index]);
            },
          ),
        ),

        // Dots Indicator below the carousel
        buildDotsIndicator(),
      ],
    );
  }
}

class DotsIndicator extends StatelessWidget {
  final int currentIndex;
  final int totalDots;

  const DotsIndicator({
    super.key,
    required this.currentIndex,
    required this.totalDots,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalDots,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          height: 8,
          width: index == currentIndex ? 12 : 8,
          decoration: BoxDecoration(
            color: index == currentIndex ? Colors.black : Colors.grey,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
