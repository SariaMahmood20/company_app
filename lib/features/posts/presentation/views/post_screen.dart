import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:deutics_attendance_app/features/posts/presentation/widgets/new_post_card.dart';
import 'package:deutics_attendance_app/features/posts/presentation/widgets/post_card.dart';
import 'package:deutics_attendance_app/app/views/widget/my_app_bar.dart';
import 'package:deutics_attendance_app/app/views/widget/navigation_bar.dart';
import 'package:deutics_attendance_app/app/views/widget/my_drawer.dart';


class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(appBarTitle: "Posts"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10.h,),
              NewPostCard(),
              const PostCard(),
              SizedBox(height: 20.h,)
            ],          
          ),
        ),
      ),
      bottomNavigationBar: MyNavigationBar(),
      drawer: MyDrawer(),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:deutics_attendance_app/app/resources/app_theme.dart';

// class PostScreen extends StatelessWidget {
//   const PostScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final styles = Theme.of(context).extension<AppTheme>()!;
//     return Scaffold(
//       body: Center(
//         child: Text(
//           "Hi!",
//           // style: TextStyle(color: Colors.black),
//           style: styles.roboto20w600,
//           ),
//       ),
//     );
//   }
// }