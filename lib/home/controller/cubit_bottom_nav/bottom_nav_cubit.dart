import 'package:advancednews/home/data/cache/cache_helper.dart';
import 'package:advancednews/home/views/category_news_view.dart';
import 'package:advancednews/home/views/every_thing_view.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(BottomNavInitial());
  static BottomNavCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  final List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.newspaper), label: 'every thing'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.business), label: 'business'),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'sports'),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: 'science'),
  ];
  void changeIndexBottomNav(int index) {
    currentIndex = index;
    emit(BottomNavChange());
  }

  final List<Widget> screens = const [
    EveryThingView(),
    CategoryNewsView(category: 'business'),
    CategoryNewsView(category: 'sports'),
    CategoryNewsView(category: 'science'),
  ];
  bool isDark = false;
  void changeAppMode({bool? fromShard}) {
    if (fromShard != null) {
      isDark = fromShard;
      emit(ChangeAppMode());
    } else {
      isDark = !isDark;
      CacheHelper.setBool('isDark', isDark).then((value) {
        return emit(ChangeAppMode());
      });
    }
  }
}
