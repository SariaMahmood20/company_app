import 'package:deutics_attendance_app/features/auth/presentation/widgets/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../app/routes/routes_name.dart';
import '../../../../app/utils/utils.dart';
import '../../../../app/views/widget/app_button.dart';
import '../view_models/auth_view_model.dart';
import '../widgets/headings.dart';
import '../widgets/text_button.dart';


class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final AuthViewModel _viewModel = AuthViewModel();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
                    style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 23.sp,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                  CustomTextButton(
                    text: 'REGISTER',
                    fontSize: 15,
                    textDecoration: TextDecoration.underline,
                    onPressed: (){
                      Navigator.pushNamed(context, RoutesName.signUp);
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
              EditTextField(
                  labelText: 'Email Address',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                currentFocusNode: emailFocusNode,
                nextFocusNode: passwordFocusNode,
              ),
              15.verticalSpace,
              EditTextField(
                  labelText: 'Password',
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                currentFocusNode: passwordFocusNode,
              ),
              10.verticalSpace,
              Align(
                alignment: Alignment.centerRight,
                child: CustomTextButton(
                  text: 'FORGOT PASSWORD?',
                  fontSize: 14,
                  textDecoration: TextDecoration.underline,
                  onPressed: (){
                    Navigator.pushNamed(context, RoutesName.forgotPassword);
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
                        loading: provider.isLoading,
                        buttonText: "SIGN IN",
                        onPressed: (){
                          if (emailController.text.isEmpty) {
                            Utils.flushBarErrorMessages(
                                "Please enter Email", context);
                          } else if (passwordController.text.isEmpty) {
                            Utils.flushBarErrorMessages(
                                "Please enter Password", context);
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
            ],
          ),
        ),
      ),
    );
  }
}
