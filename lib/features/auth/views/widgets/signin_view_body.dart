import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/utils/colors.dart';
import 'package:fruit_hub/core/utils/custom_button.dart';
import 'package:fruit_hub/features/auth/persentation/manager/signin_cubit/signin_cubit.dart';
import 'package:fruit_hub/features/auth/views/widgets/social_login_button.dart';
import 'package:fruit_hub/features/auth/views/widgets/or_divider.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_text_field.dart';
import 'dont_have_an_account.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              CustomTextField(
                onSaved: (value) {
                  email = value!;
                },
                hintText: 'البريد الاكتروني',
                TextInputField: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextField(
                onSaved: (value){
                  password = value!;
                },
                hintText: 'كلمة المرور',
                TextInputField: TextInputType.visiblePassword,
                icon: Icon(
                  Icons.remove_red_eye_rounded,
                  color: Color(0xffC9CECF),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'نسيت كلمة المرور؟',
                    style: TextStyles.semiBold13
                        .copyWith(color: AppColors.lightPrimaryColor),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
              SizedBox(
                height: 33,
              ),
              CustomButton(onPressed: () {
                if(formKey.currentState!.validate()){
                  formKey.currentState!.save();

                  context.read<SignInCubit>().signIn(email, password);
                }else{
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {
                  });
                }
              }, text: 'تسجيل دخول'),
              SizedBox(
                height: 33,
              ),
              DontHaveAnAccountWidget(),
              SizedBox(
                height: 33,
              ),
              OrDivider(),
              SizedBox(
                height: 33,
              ),
              SocialLoginButton(
                  image: Assets.imagesGoogleIcon,
                  title: 'تسجيل بواسطة جوجل',
                  onPressed: () {
                    context.read<SignInCubit>().signInWithGoogle();
                  }),
              SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                  image: Assets.imagesAppleIcon,
                  title: 'تسجيل بواسطة فيس بوك',
                  onPressed: () {
                    context.read<SignInCubit>().signInWithFacebook();
                  }),
              SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                  image: Assets.imagesFaceBookIcon,
                  title: 'تسجيل بواسطة فيس بوك',
                  onPressed: () {
                     context.read<SignInCubit>().signInWithFacebook();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
