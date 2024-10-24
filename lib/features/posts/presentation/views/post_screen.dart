import 'package:deutics_attendance_app/features/posts/presentation/view_models/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:deutics_attendance_app/features/posts/presentation/widgets/new_post_card.dart';
import 'package:deutics_attendance_app/features/posts/presentation/widgets/post_card.dart';


class PostScreen extends StatelessWidget {

  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch applications for the user when the screen loads
    final postViewModel = Provider.of<PostViewModel>(context, listen: false);
    postViewModel.getPosts();


    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          children: [
            NewPostCard(),
            SizedBox(height: 20.h),
            Expanded(
              child: Consumer<PostViewModel>(
                builder: (context, postProvider, child) {
                  if (postProvider.errorMessage != null) {
                    return Center(child: Text(postProvider.errorMessage!));
                  }

                  if (postProvider.posts.isEmpty) {
                    return const Center(child: Text("No applications found."));
                  }

                  return ListView.builder(
                    itemCount: postProvider.posts.length,
                    itemBuilder: (context, index) {

                      return PostCard(
                        postContent: postProvider.posts[index].content, // Use default or user data if available
                        
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
