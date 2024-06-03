import 'package:flutter/material.dart';
import 'package:store/core/widgets/app_text.dart';
import 'package:store/core/routes/app_routes.dart';
import 'package:store/core/routes/app_routes.dart';
import 'package:store/core/widgets/app_linear_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/core/widgets/app_custom_painter.dart';
import 'package:store/core/helpers/navigator_extension.dart';
import 'package:store/core/extensions/navigator_extension.dart';
import 'package:store/core/helpers/fonts/font_weight_helper.dart';
import 'package:store/features/onboarding/widgets/elevated_button.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

late PageController _pageController;
int _pageIndex = 0;

class _OnboardingScreenState extends State<OnboardingScreen> {
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
      bottomNavigationBar:  CustomPaint(
        size: Size(
          double.infinity,
          150.h,
        ),
        painter: AppCustomPainter(
          gradient: LinearGradient(
            colors: [
              context.color.bluePinkLight!,
              context.color.bluePinkLight!,
              context.color.bluePinkLight!,
              context.color.bluePinkLight!,
            ],
          ),
        ),),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: onboard_data.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => OnboardingContent(
                    image: onboard_data[index].image,
                    title: onboard_data[index].title,
                    description: onboard_data[index].description,
                    textButton: onboard_data[index].buttonText,
                  ),
                ),
              ),
<<<<<<< Updated upstream
              SizedBox(
                height: 60.h,
                width: 60.w,
              ),
=======
              
>>>>>>> Stashed changes
            ],
          ),
        ),
      ),
    );
  }
}

class OnBoard {
  OnBoard(
      {required this.image,
      required this.title,
      required this.description,
      required this.buttonText,}
  );
  final String image;
  final String title;
  final String description;
   final String buttonText;
}

final List<OnBoard> onboard_data = [
  OnBoard(
<<<<<<< Updated upstream
    image: 'assets/images/onboard(1).png',
=======
    image: 'assets/images/core/onboard(1).png',
>>>>>>> Stashed changes
    title: 'Choose and Orderd online',
    description:
        'We have 100 thousand products. Choose your product from our store and order it',
    buttonText: 'Next',
  ),
  OnBoard(
<<<<<<< Updated upstream
    image: 'assets/images/onboard(2).png',
=======
    image: 'assets/images/core/onboard(2).png',
>>>>>>> Stashed changes
    title: 'Easy and safe to buy',
    description: 'You can pay in cash or through electronic payment gateways',
    buttonText: 'Next',
  ),
  OnBoard(

    image: 'assets/images/core/onboard(3).png',

    title: 'Delivery service',
    description:
        'You can track your request at every stage and also track it through the map',
    buttonText: 'Get Started',
  ),
];

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    required this.image,
    required this.title,
    required this.description,
    required this.textButton,
    super.key,
  });
  final String image;
  final String title;
  final String description;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          image,
          height: 250.h,
        ),
        const Spacer(),
<<<<<<< Updated upstream
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Color(0xff005ae0), fontSize: 25),
        ),
        const SizedBox(height: 16),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20),
        ),
        const Spacer(),
        Row(
=======
       TextApp(
          text:title,
          textAlign: TextAlign.center,
          theme: context.textStyle.copyWith(fontSize: 25.sp,fontWeight: FontWeightHelper.bold, color:context.color.bluePinkLight),
          
          
        ),
        SizedBox(height: 16.h),
        TextApp(
          text:description,
          textAlign: TextAlign.center,
          theme: context.textStyle.copyWith(fontSize: 20.sp,color:context.color.bluePinkLight),  
        ),
        SizedBox(height: 40.h),
        LinearButton(onPressed:(){
           if (_pageIndex == onboard_data.length - 1) {
                  context.pushReplacementNamed(AppRoutes.login);
                } else {
                  _pageController.nextPage(
                    duration: const Duration(microseconds: 300),
                    curve: Curves.ease,
                  );
                }
              },
              width: 140.w,
         child:TextApp(text: textButton, theme:context.textStyle.copyWith(fontWeight: FontWeightHelper.bold,fontSize:16.sp))),
       SizedBox(height: 25.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
>>>>>>> Stashed changes
          children: [
            ...List.generate(
              onboard_data.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: DotIndactor(
                  isActive: index == _pageIndex,
                ),
              ),
            ),
<<<<<<< Updated upstream
            const Spacer(),
            AppElevatedButton(
              onPressed: () {
                if (_pageIndex == onboard_data.length - 1) {
                  context.pushReplacementNamed(AppRoutes.home);
                } else {
                  _pageController.nextPage(
                    duration: const Duration(microseconds: 300),
                    curve: Curves.ease,
                  );
                }
              },
              buttonText: textButton,
            ),
          ],
        ),
=======
            
        ],),
>>>>>>> Stashed changes
      ],
    );
  }
}

class DotIndactor extends StatelessWidget {
  const DotIndactor({super.key, this.isActive = false});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
<<<<<<< Updated upstream
      height: isActive ? 12.h : 4.h,
      width: 4.w,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xff005ae0) : Colors.grey,
=======
      height: isActive ? 22.h : 8.h,
      width: 4.w,
      decoration: BoxDecoration(
        color: isActive ? context.color.bluePinkLight : Colors.grey,
>>>>>>> Stashed changes
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
      ),
    );
  }
}
