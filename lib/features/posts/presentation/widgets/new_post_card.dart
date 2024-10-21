import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:deutics_attendance_app/app/views/widget/button.dart';
import 'package:deutics_attendance_app/app/resources/app_theme.dart';


class NewPostCard extends StatelessWidget {
  NewPostCard({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color(0xDDF8F8F8),
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                spreadRadius: 0,
                blurRadius: 3,
                offset: Offset(0, 5),
              ),
            ],
          ),
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
                        Text("Saria Mahmood", style: styles.roboto16w600),
                        Text(
                          "Flutter Developer",
                          style: styles.roboto8w400,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      fillColor: Colors.transparent,
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: "What`s on your mind?",
                      alignLabelWithHint: true,
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide.none)),
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ),

        // Container(
        //   decoration: const BoxDecoration(
        //     borderRadius: BorderRadius.all(Radius.circular(25))
        //   ),
        //   width: double.infinity,
        //   child: Card(
        //     color: styles.neutralColor,
        //     elevation: 6.h,
        //     child: Padding(
        //       padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
        //       child: Column(
        //         children: [
        //           Row(
        //             children: [
        //               const CircleAvatar(),
        //               SizedBox(
        //                 width: 10.w,
        //               ),
        //               Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Text(
        //                     "Saria Mahmood",
        //                     style: styles.roboto16w600,
        //                   ),
        //                   Text(
        //                     "Flutter Developer",
        //                     style: styles.roboto8w400,
        //                     ),
        //                 ],
        //               )
        //             ],
        //           ),
        //           SizedBox(height: 15.h,),
        //           Padding(
        //             padding: EdgeInsets.symmetric(horizontal: 20.w),
        //             child: Text(
        //               "What's on your mind?",
        //               style: styles.roboto16w400.copyWith(color: Colors.grey),
        //               ),
        //           )
        //         ],
        //       ),
        //     ),
        //   )
        // ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Button(
              width: 99,
              buttonText: "DRAFT",
              onPressed: () {},
            ),
            Button(width: 99, buttonText: "POST", onPressed: () {})
          ],
        ),
        SizedBox(
          height: 20.h,
        )
      ],
    );
  }
}
