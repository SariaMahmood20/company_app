import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:deutics_attendance_app/features/posts/presentation/widgets/new_post_card.dart';
import 'package:deutics_attendance_app/features/posts/presentation/widgets/post_card.dart';

import '../../../../app/views/widget/custom_appbar.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(title: "POSTS"),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 10.h,),
              NewPostCard(),
              const PostCard(),
              SizedBox(height: 20.h,)
            ],
          ),
        )
    );
  }
}