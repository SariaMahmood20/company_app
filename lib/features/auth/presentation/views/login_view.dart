import 'package:deutics_attendance_app/app/utils/utils_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:deutics_attendance_app/app/navigation/route_names.dart';
import 'package:deutics_attendance_app/app/resources/app_theme.dart';
import 'package:deutics_attendance_app/app/views/widget/app_button.dart';
import 'package:deutics_attendance_app/features/auth/presentation/widgets/headings.dart';
import 'package:deutics_attendance_app/features/auth/presentation/widgets/text_button.dart';
import 'package:deutics_attendance_app/features/auth/presentation/view_models/auth_view_model.dart';


class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordFocusNode.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final AuthViewModel _viewModel = Provider.of<AuthViewModel>(context);
    // _viewModel.setLoading(true);
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
                    'SIGN IN',
                    style: styles.roboto20w600
                  ),
                  CustomTextButton(
                    text: 'REGISTER',
                    fontSize: 15,
                    textDecoration: TextDecoration.underline,
                    onPressed: (){
                      Navigator.pushNamed(context, RouteNames.register);
                    },
                  ),
                ],
              ),
              40.verticalSpace,
              const CustomTextColumn(
                titleText: 'HAVE AN ACCOUNT?',
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
                    hintStyle: styles.roboto14w600.copyWith(color: Colors.grey),
                ),
                focusNode: emailFocusNode,
              ),
              15.verticalSpace,
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: styles.roboto14w600.copyWith(color: Colors.grey),
                ),
                obscureText: true,
                focusNode: passwordFocusNode,
              ),
            
              10.verticalSpace,
              Align(
                alignment: Alignment.centerRight,
                child: CustomTextButton(
                  text: 'FORGOT PASSWORD?',
                  fontSize: 14,
                  textDecoration: TextDecoration.underline,
                  onPressed: (){
                    Navigator.pushNamed(context, RouteNames.forgotPassword);
                  },
                ),
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
                        buttonText: "SIGN IN",
                        onPressed: (){
                          if (emailController.text.isEmpty) {
                            UtilsFunction.showFlushbarMessage(context, Colors.red, "Please enter Email");
                          } else if (passwordController.text.isEmpty) {
                            UtilsFunction.showFlushbarMessage(context, Colors.red, "Please enter Password");
                          } else {
                            provider.loginUser(
                                email: emailController.text,
                                password: passwordController.text,
                                context: context);
                          }
                        },),
                    );
                  },
                )
              ),
            ]
              ),
          ),
        ),
      );
  }
}