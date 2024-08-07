import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/features/on_boarding/views/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        PageViewItem(
          image: Assets.imagesPageViewItem1,
          backgroundImage: Assets.imagesPageViewBackground1,
          subtitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('مرحبًا بك في'),
              Text('Fruit'),
              Text('Hub'),
            ],
          ),
        ),
        PageViewItem(
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
