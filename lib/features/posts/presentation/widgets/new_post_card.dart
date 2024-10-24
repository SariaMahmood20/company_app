import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:deutics_attendance_app/app/views/widget/button.dart';
import 'package:deutics_attendance_app/app/resources/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:deutics_attendance_app/app/utils/utils_function.dart';
import 'package:deutics_attendance_app/features/posts/presentation/view_models/post_view_model.dart';


class NewPostCard extends StatelessWidget {
  final newPostController = TextEditingController();
  NewPostCard({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Consumer<PostViewModel>(
      builder: (context, postProvider, child){
        return Column(
      children: [
        Container(
          width: double.infinity,
          child: Card(
            color: styles.neutralColor,
            elevation: 6.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Saria Mahmood",
                            style: styles.roboto16w600,
                          ),
                          Text(
                            "Flutter Developer",
                            style: styles.roboto8w400,
                            ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 15.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: TextField(
                      controller: newPostController,
                      decoration: InputDecoration(
                        hintText: "What's on  your mind?",
                        hintStyle: styles.roboto16w600.copyWith(color: Colors.grey),
                        hintTextDirection: TextDirection.ltr,
                        enabledBorder: InputBorder.none
                      ),
                      ),
                  )
                ],
              ),
            ),
          )
        ),
        SizedBox(height: 6.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Button(
              width: 99,
              buttonText: "DRAFT",
              onPressed: () {},
            ),
            Button(
              width: 99, 
              buttonText: "POST", 
              onPressed: ()async {
                final postContent = newPostController.text.trim();
                await postProvider.submitPost(content: postContent, time: Timestamp.now());
                newPostController.clear();
                // UtilsFunction.showFlushbarMessage(context, Colors.greenAccent, "Posted Successfully");
            })
          ],
        ),
        SizedBox(
          height: 20.h,
        )
      ],
            );
      },
    );
  }
}
