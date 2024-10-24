import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String imageUrl;
  const ImageWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: 120.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xD7A8A6A6),
          width: 3
        )
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl),
          loadingBuilder: (context, child, loadingProgress){
            if(loadingProgress == null) return child;
            return const Center(child: CircularProgressIndicator(),);
          },
          errorBuilder: (context, object, stack){
            return const Icon(Icons.error_outline_rounded,);
          },
        ),
      )
    );
  }
}
