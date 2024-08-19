import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/features/auth/persentation/manager/signup_cubits/signup_cubit.dart';
import 'package:fruit_hub/features/auth/persentation/manager/signup_cubits/signup_state.dart';
import 'package:fruit_hub/features/auth/views/widgets/terms_and_conditions.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../core/utils/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import 'dont_have_an_account.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late bool isTermsAccepted = false;
  late String email, userName, password;

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
              const SizedBox(
                height: 24,
              ),
              CustomTextField(
                onSaved: (value) {
                  userName = value!;
                },
                hintText: 'الاسم كامل',
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                onSaved: (value) {
                  email = value!;
                },
                hintText: 'البريد الإلكتروني',
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                onSaved: (value) {
                  password = value!;
                },
                hintText: 'كلمة المرور',
              ),
              const SizedBox(
                height: 16,
              ),
              TermsAndConditions(),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<SignupCubit>().createUserWithEmailAndPassword(
                        email, password, userName);
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: 'إنشاء حساب جديد',
              ),
              const SizedBox(
                height: 26,
              ),
              const DontHaveAnAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
         // Navigator.of(context).pop();
        }
        if (state is SignupFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is SignupLoading ? true : false,
            child: SignupViewBody());
      },
    );
  }
}
