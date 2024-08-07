import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/colors.dart';
import 'package:fruit_hub/features/on_boarding/views/widgets/page_view_item.dart';

import '../../../../core/utils/app_text_styles.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});

  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,

      children: [
        PageViewItem(
          isVisible: true,
          image: Assets.imagesPageViewItem1,
          backgroundImage: Assets.imagesPageViewBackground1,
          subtitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('مرحبًا بك في',
              style: TextStyles.bold23,),
              Text('HUB',
                style: TextStyles.bold23.copyWith(color: AppColors.secondaryColor),
              ),
              Text('Fruit',
                style: TextStyles.bold23.copyWith(color: AppColors.primaryColor),),
            ],
          ),
        ),
        PageViewItem(
          isVisible: false,
          image: Assets.imagesPageViewItem2,
          backgroundImage: Assets.imagesPageViewBackground2,
          subtitle:
          'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية.',
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('ابحث وتسوق',
              textAlign: TextAlign.center,
              style:TextStyle(
                color: Color(0xFF0c0D0D),
                fontSize: 23,
                fontFamily: 'cairo',
                fontWeight: FontWeight.w700,
                height: 0,

              ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
