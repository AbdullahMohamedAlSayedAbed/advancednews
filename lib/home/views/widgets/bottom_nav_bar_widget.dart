import 'package:advancednews/home/controller/cubit_bottom_nav/bottom_nav_cubit.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    super.key,
    required this.cubit,
  });

  final BottomNavCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (index) {
          cubit.changeIndexBottomNav(index);
        },
        elevation: 20,
        currentIndex: cubit.currentIndex,
        items: cubit.bottomItems);
  }
}
