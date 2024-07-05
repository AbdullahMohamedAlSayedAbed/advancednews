import 'package:advancednews/home/controller/cubit_bottom_nav/bottom_nav_cubit.dart';
import 'package:advancednews/home/views/search_view.dart';
import 'package:advancednews/home/views/widgets/bottom_nav_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = BottomNavCubit.get(context);
    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 20,
            title: const Text('News App'),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SearchView(),
                        ));
                  },
                  icon: const Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                    BottomNavCubit.get(context).changeAppMode();
                  },
                  icon: const Icon(Icons.brightness_4_outlined)),
              // IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBarWidget(cubit: cubit),
        );
      },
    );
  }
}
