import 'package:deutics_attendance_app/features/auth/data/services/session_manager.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:deutics_attendance_app/app/views/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:deutics_attendance_app/app/resources/app_theme.dart';
import 'package:deutics_attendance_app/features/user/widgets/edit_info.dart';
import '../../../app/views/widget/my_drawer.dart';
import '../view_models/user_view_model.dart';
import '../widgets/image_widget.dart';
import 'package:provider/provider.dart';

class ProfileSettingsScreen extends StatelessWidget {
  ProfileSettingsScreen({super.key});


  final ref = FirebaseDatabase.instance.ref('Users');
  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Scaffold(
      appBar: const CustomAppbar(title: "PROFILE SETTINGS"),
      drawer: const MyDrawer(),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
          child: ChangeNotifierProvider(
            create: (context) => UserViewModel()..fetchUser(context),
            child: Consumer<UserViewModel>(
              builder: (context, provider, child){
                final user = Provider.of<UserViewModel>(context).user;
                if(user == null){
                  return const Center(child: CircularProgressIndicator());
                }else {
                  return Column(
                    children: [
                      ImageWidget(imageUrl: user.imgUrl),
                      SizedBox(height: 25.h,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Name", style: styles.roboto14w600),
                          SizedBox(height: 15.h,),
                          Text(user.name, style: styles.roboto14w400.copyWith(color: Colors.grey),),
                          SizedBox(height: 10.h,),
                          const Divider(),
                          SizedBox(height: 10.h,),
                          Text("Designation", style: styles.roboto14w600),
                          SizedBox(height: 15.h,),
                          EditInfoRow(text: user.designation),
                          SizedBox(height: 10.h,),
                          const Divider(),
                          SizedBox(height: 10.h,),
                          Text("Email", style: styles.roboto14w600),
                          SizedBox(height: 15.h,),
                          Text(user.email, style: styles.roboto14w400.copyWith(color: Colors.grey),),
                          SizedBox(height: 10.h,),
                          const Divider(),
                          SizedBox(height: 10.h,),
                          Text("About Us", style: styles.roboto14w600),
                          SizedBox(height: 25.h,),
                          EditInfoRow(text: user.about),
                          SizedBox(height: 10.h,),
                          const Divider(),
                        ],
                      )
                    ],
                  );
                }
              }
            ),
          ),
      ),
    );
  }
}