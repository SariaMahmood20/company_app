import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:deutics_attendance_app/app/navigation/route_names.dart';
import 'package:deutics_attendance_app/app/views/widget/app_button.dart';
import 'package:deutics_attendance_app/features/auth/presentation/widgets/headings.dart';
import 'package:deutics_attendance_app/features/auth/presentation/widgets/termcondition_string.dart';
import 'package:deutics_attendance_app/features/auth/presentation/widgets/text_button.dart';
import 'package:deutics_attendance_app/features/auth/presentation/view_models/auth_view_model.dart';
import 'package:deutics_attendance_app/app/resources/app_theme.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final fNameFocusNode = FocusNode();
  final lNameFocusNode = FocusNode();
  final designationFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();


  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    designationController.dispose();
    emailController.dispose();
    passwordController.dispose();
    fNameFocusNode.dispose();
    lNameFocusNode.dispose();
    designationFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => AuthViewModel(),
        child: Consumer<AuthViewModel>(
          builder: (context, provider, child){
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    left: 23.w, right: 23.w, top: 140.h, bottom: 20.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'REGISTER',
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 23.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        CustomTextButton(
                          text: 'SIGN IN',
                          fontSize: 15,
                          textDecoration: TextDecoration.underline,
                          onPressed: () {
                             Navigator.pushNamed(context, RouteNames.login);
                          },
                        ),
                      ],
                    ),
                    40.verticalSpace,
                    const CustomTextColumn(
                      titleText: 'NEW IN DEUTICS',
                      titleFontSize: 16,
                      descriptionText: 'Register to speed up',
                      descriptionFontSize: 15,
                      descriptionColor: Color(0xFF888888),
                    ),
                    50.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: firstNameController,
                            decoration: InputDecoration(
                              hintText: "First Name",
                              hintStyle: styles.roboto14w600.copyWith(color: Colors.grey)
                            ),
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return "Enter first name";
                              }
                              return null;
                            },
                          )
                        ),
                        20.horizontalSpace,
                        Expanded(
                          child: TextFormField(
                            controller: lastNameController,
                            decoration: InputDecoration(
                              hintText: "Last Name",
                              hintStyle: styles.roboto14w600.copyWith(color: Colors.grey)
                            ),
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return "Enter last name";
                              }
                              return null;
                            },
                          )
                        ),
                      ],
                    ),
                    5.verticalSpace,
                    TextFormField(
                            controller: designationController,
                            decoration: InputDecoration(
                              hintText: "Designation",
                              hintStyle: styles.roboto14w600.copyWith(color: Colors.grey)
                            ),
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return "Enter Designation";
                              }
                              return null;
                            },
                          ),
                    5.verticalSpace,
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
                    5.verticalSpace,
                    TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: styles.roboto14w600.copyWith(color: Colors.grey)
                            ),
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return "Enter Password";
                              }
                              if(value.length<6){
                                return "Enter bigger password";
                              }
                              return null;
                            },
                          ),
                    15.verticalSpace,
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.sp, vertical: 5.sp),
                      child: const TextString(
                          text:
                              'By you clicking Register Now, You agree to aur \nTerm & Conditions and Privacy Policy',
                          textFontSize: 14,
                          textColor: Color(0xFF888888)),
                    ),
                    65.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: AppButton(
                        // loading: provider.isLoading,
                          buttonText: "REGISTER NOW",
                          onPressed: () {
                            
                              provider.registerUser(
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                    designation: designationController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    context: context,
                                  );
                            
                          }),
                    ),
                  ],
                ),
              ),
            );
          },
        )
      )
    );
  }
}