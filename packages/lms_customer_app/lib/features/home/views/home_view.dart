import 'package:flutter/material.dart';

import 'sections/advantages/advantages_section.dart';
import 'sections/course/course_section.dart';
import 'sections/top/top_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        TopSection(),
        AdvantagesSection(),
        CourseSection(),
      ],
    );
  }
}
