import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:deutics_attendance_app/app/resources/app_theme.dart';
import 'package:deutics_attendance_app/app/navigation/route_names.dart';
import 'package:deutics_attendance_app/app/utils/utils_function.dart';
import 'package:deutics_attendance_app/app/views/widget/app_button.dart';
import 'package:deutics_attendance_app/features/auth/presentation/view_models/auth_view_model.dart';
import 'package:deutics_attendance_app/features/auth/presentation/widgets/headings.dart';
import 'package:deutics_attendance_app/features/auth/presentation/widgets/text_button.dart';



class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final AuthViewModel _viewModel = AuthViewModel();

  final TextEditingController emailController = TextEditingController();
  final emailFocusNode = FocusNode();



  @override
  void dispose() {
    emailController.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 23.w, right: 23.w, top: 140.h, bottom: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Email Verification',
                    style: styles.roboto20w600
                  ),
                  CustomTextButton(
                    text: 'SIGN IN',
                    fontSize: 15,
                    textDecoration: TextDecoration.underline,
                    onPressed: (){
                      Navigator.pushNamed(context, RouteNames.login);
                    },
                  ),
                ],
              ),
              40.verticalSpace,
              const CustomTextColumn(
                titleText: 'Please Verify Your Email',
                titleFontSize: 16,
                descriptionText: 'Sign in to speed up the checkout \nprocess',
                descriptionFontSize: 15,
                descriptionColor: Color(0xFF888888),
              ),
              50.verticalSpace,
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Email Address",
                  hintStyle: styles.roboto14w600.copyWith(color: Colors.grey)
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Enter email address";
                  }
                  return null;
                },
              ),
              100.verticalSpace,
              ChangeNotifierProvider(
                  create: (_) => AuthViewModel(),
                  child: Consumer<AuthViewModel>(
                    builder: (context, provider, child){
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: AppButton(
                          // loading: provider.isLoading,
                          buttonText: "Send",
                          onPressed: (){
                            if (emailController.text.isEmpty) {

                            }else {
                              provider.sendPasswordResetEmail(
                                  email: emailController.text,
                                  context: context);
                            }
                          },),
                      );
                    },
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}