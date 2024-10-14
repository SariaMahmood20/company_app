import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:deutics_attendance_app/app/views/widget/button.dart';

class NewPostCard extends StatelessWidget {
  const NewPostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
        ),
        SizedBox(height: 6.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Button(
              width: 99,
              buttonText: "DRAFT",
              onPressed: (){},
              ),
            Button(
              width: 99,
              buttonText: "POST",
              onPressed: (){}
              )
          ],
        ),
        SizedBox(height: 35.h,)
      ],
    );
  }
}