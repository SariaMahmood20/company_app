import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/routes/routes_name.dart';
import '../../../../app/utils/utils.dart';
import '../../../../app/views/widget/app_button.dart';
import '../view_models/auth_view_model.dart';
import '../widgets/headings.dart';
import '../widgets/termcondition_string.dart';
import '../widgets/text_button.dart';
import '../widgets/text_field.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final SignInViewModel _viewModel = SignInViewModel();


  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    designationController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                      _viewModel.registerUser(
                        firstName: firstNameController.text,
                        lastName: lastNameController.text,
                        designation: designationController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        context: context,
                      );
                      // Navigator.pushNamed(context, RoutesName.login);
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
                    child: EditTextField(
                      controller: firstNameController,
                      labelText: 'First Name',
                      keyboardType: TextInputType.text,
                      obscureText: false,
                    ),
                  ),
                  20.horizontalSpace,
                  Expanded(
                    child: EditTextField(
                      controller: lastNameController,
                      labelText: 'Last Name',
                      keyboardType: TextInputType.text,
                      obscureText: false,
                    ),
                  ),
                ],
              ),
              5.verticalSpace,
              EditTextField(
                controller: designationController,
                labelText: 'Designation',
                keyboardType: TextInputType.text,
                obscureText: false,
              ),
              5.verticalSpace,
              EditTextField(
                controller: emailController,
                labelText: 'Email Address',
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
              ),
              5.verticalSpace,
              EditTextField(
                controller: passwordController,
                labelText: 'Password',
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
              ),
              15.verticalSpace,
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 15.sp, vertical: 5.sp),
                child: const TextString(
                    text:
                        'By you clicking Register Now, Ypu agree to aur \nTerm & Conditions and Privacy Policy',
                    textFontSize: 14,
                    textColor: Color(0xFF888888)),
              ),
              65.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: AppButton(
                    buttonText: "REGISTER NOW",
                    onPressed: () {
                      if (firstNameController.text.isEmpty) {
                        Utils.flushBarErrorMessages(
                            "Please enter First Name", context);
                      } else if (lastNameController.text.isEmpty) {
                        Utils.flushBarErrorMessages(
                            "Please enter Last Name", context);
                      } else if (designationController.text.isEmpty) {
                        Utils.flushBarErrorMessages(
                            "Please enter Last Name", context);
                      } else if (emailController.text.isEmpty) {
                        Utils.flushBarErrorMessages(
                            "Please enter Email", context);
                      } else if (passwordController.text.isEmpty) {
                        Utils.flushBarErrorMessages(
                            "Please enter Password", context);
                      } else if (passwordController.text.length < 6) {
                        Utils.flushBarErrorMessages(
                            "Password must be greater then 6", context);
                      } else {
                        Navigator.pushNamed(context, RoutesName.navigationBar);
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
