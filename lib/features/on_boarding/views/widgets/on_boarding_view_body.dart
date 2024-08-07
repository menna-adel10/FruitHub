import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/colors.dart';
import '../../../../core/utils/custom_button.dart';
import 'on_boarding_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}


class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {

  late PageController pageController;
  var currentPage = 0;
  void initState(){
    pageController = PageController();
    pageController.addListener((){
      //update current page
      currentPage = pageController.page!.round();
    });
    super.initState();
  }
  void dispose(){
    pageController = PageController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: OnBoardingPageView(
            pageController: pageController,
          ),
        ),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            color: AppColors.primaryColor.withOpacity(0.5),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        CustomButton(
          onPressed: () {},
          text: 'ابدأ الان',
        ),
        SizedBox(
          height: 43,
        ),
      ],
    );
  }
}

