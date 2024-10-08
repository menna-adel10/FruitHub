import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/services/shared_preferences_singlton.dart';
import 'package:fruit_hub/core/utils/colors.dart';
import '../../../../core/utils/custom_button.dart';
import '../../../auth/views/sign_in_view.dart';
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
      setState(() {
      });
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
            color: currentPage ==1?
                AppColors.primaryColor:
                AppColors.primaryColor.withOpacity(0.5),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Visibility(
          visible: currentPage == 1? true :false,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: CustomButton(
            onPressed: () {
              //akhzen key 34an y2oly en lpage de etshafet
              prefs.setBool(kIsOnBoardingViewSeen, true);
              Navigator.of(context)
                  .pushReplacementNamed(SignInView.routeName);
            },
            text: 'ابدأ الان',
          ),
        ),
        SizedBox(
          height: 43,
        ),
      ],
    );
  }
}

