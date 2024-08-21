import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/services/shared_preferences_singlton.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/features/auth/views/sign_in_view.dart';
import 'package:fruit_hub/features/on_boarding/views/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState(){
    executeNavigation();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [SvgPicture.asset(Assets.imagesPlant),
          ],
        ),
        SvgPicture.asset(Assets.imagesLogo),
        SvgPicture.asset(Assets.imagesSplashBottom,
        fit: BoxFit.fill,),


      ],
    );

  }
  void executeNavigation(){
    bool isOnBoardingViewSeen = prefs.getBool(kIsOnBoardingViewSeen);
    Future.delayed(const Duration(seconds:2),(){
      if (isOnBoardingViewSeen) {
        Navigator.pushReplacementNamed(context, SignInView.routeName);
      }
      else{
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);

      }
    });
  }
}
