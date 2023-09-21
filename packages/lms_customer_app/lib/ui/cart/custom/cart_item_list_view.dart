import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_models/cart/courses_in_cart/courses_in_cart_cubit.dart';
import '../../../view_models/cart/courses_in_cart/courses_in_cart_state.dart';
import 'cart_item_cell.dart';

class CartItemListView extends StatelessWidget {
  const CartItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoursesInCartCubit, CoursesInCartState>(
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
                  child: CartItemCell(
                    title: course.title,
                    author: course.instructor,
                    description: course.description,
                    coverImage: Image.network(
                      course.coverImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Text _buildCourseIndex(int index) => Text(
        index.toString(),
        style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
      );
}
