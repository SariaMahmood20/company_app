import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/routes/routes_name.dart';
import '../../../../app/utils/utils.dart';
import '../../../../app/views/widget/app_button.dart';
import '../view_models/auth_view_model.dart';
import '../widgets/headings.dart';
import '../widgets/text_button.dart';
import '../widgets/text_field.dart';
import 'package:provider/provider.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
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
                    style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 23.sp,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                  CustomTextButton(
                    text: 'SIGN IN',
                    fontSize: 15,
                    textDecoration: TextDecoration.underline,
                    onPressed: (){
                      Navigator.pushNamed(context, RoutesName.login);
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
              EditTextField(
                  labelText: 'Email Address',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                currentFocusNode: emailFocusNode,
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
                          buttonText: "Send",
                          onPressed: (){
                            if (emailController.text.isEmpty) {
                              Utils.flushBarErrorMessages(
                                  "Please enter Email", context);
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
