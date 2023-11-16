import 'package:cached_network_image/cached_network_image.dart';
import 'package:faker_api_impl/core/constants/style_constants.dart';
import 'package:faker_api_impl/features/home/data/models/user_model.dart';
import 'package:faker_api_impl/features/home/presentation/widgets/shimmer_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserItem extends StatelessWidget {
  final User item;

  const UserItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: Container(
            width: 60.w,
            height: 60.w,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: CachedNetworkImage(
              imageUrl: item.image,
              placeholder: (context, url) => ShimmerContainer(
                borderRadius: BorderRadius.circular(10.r),
              ),
              errorWidget: (context, url, error) => CachedNetworkImage(imageUrl: 'https://demofree.sirv.com/nope-not-here.jpg',),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${item.firstname} ${item.lastname}",
                  style: StyleConstants.s15_w500_000000,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  item.email,
                  style: StyleConstants.s15_w400_000000,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
