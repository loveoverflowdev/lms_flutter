import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lms_customer_app/config/status/loading_status.dart';

import '../../../view_models/cart/courses_in_cart/courses_in_cart_cubit.dart';
import '../../../view_models/cart/courses_in_cart/courses_in_cart_state.dart';
import 'cell/course_item_in_cart_cell.dart';

extension CartItemListViewAction on CartItemListView {
  void coursesInCartModifyingListener(
      BuildContext context, CoursesInCartState state) {
    switch (state.loadingStatus) {
      case LoadingStatus.loading:
        EasyLoading.show();
      default:
        EasyLoading.dismiss();
    }
  }
}

class CartItemListView extends StatelessWidget {
  const CartItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CoursesInCartCubit, CoursesInCartState>(
      listener: coursesInCartModifyingListener,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${state.courseList.length} khóa học trong Giỏ hàng",
              style: const TextStyle(
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 12),
            ListView.builder(
              shrinkWrap: true,
              itemCount: state.courseList.length,
              itemBuilder: (context, index) {
                final course = state.courseList[index];
                return Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Theme.of(context).dividerColor),
                    ),
                  ),
                  child: CourseItemInCartCell(
                    course: course,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
