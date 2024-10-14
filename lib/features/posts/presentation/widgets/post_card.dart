import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
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
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Saria Mahmood",
                      ),
                      Text("Flutter Developer"),
                    ],
                  )
                ],
              ),
              SizedBox(height: 15.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: const Text("What's on your mind?"),
              )
            ],
          ),
        ),
      )
    );
  }
}