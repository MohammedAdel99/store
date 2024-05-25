import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: onboard_data.length,
                  controller: _pageController,
                  onPageChanged: (index){
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => OnboardingContent(
                      image: onboard_data[index].image,
                      title: onboard_data[index].title,
                      description: onboard_data[index].description),
                ),
              ),
              SizedBox(
                height: 60.h,
                width: 60.w,
              ),
              Row(
                children: [
                  ...List.generate(
                    onboard_data.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: dotIndactor(
                        isActive: index == _pageIndex,
                      ),
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(microseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnBoard {
  final String image, title, description;
  OnBoard(
      {required this.image, required this.title, required this.description});
}

final List<OnBoard> onboard_data = [
  OnBoard(
      image: 'assets/images/onboard(1).png',
      title: 'Choose and Orderd online',
      description:
          'We have 100 thousand products. Choose your product from our store and order it'),
  OnBoard(
      image: 'assets/images/onboard(2).png',
      title: 'Easy and safe to buy',
      description:
          'You can pay in cash or through electronic payment gateways'),
  OnBoard(
      image: 'assets/images/onboard(3).png',
      title: 'Delivery service',
      description:
          'You can track your request at every stage and also track it through the map'),
];

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    required this.image,
    required this.title,
    required this.description,
    super.key,
  });
  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(image),
        const Spacer(),
        Text(title),
        const SizedBox(height: 16),
        Text(description),
        const Spacer(),
      ],
    );
  }
}

class dotIndactor extends StatelessWidget {
  const dotIndactor({super.key, this.isActive = false});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isActive ? 12.h : 4.h,
      width: 4.w,
      decoration: BoxDecoration(
        color: isActive ? const Color.fromARGB(255, 2, 15, 159) : Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
      ),
    );
  }
}
