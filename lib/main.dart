import 'package:advancednews/home/controller/cubit_api_server/api_servers_cubit.dart';
import 'package:advancednews/home/controller/cubit_bottom_nav/bottom_nav_cubit.dart';
import 'package:advancednews/home/data/api_service.dart';
import 'package:advancednews/home/data/cache/cache_helper.dart';
import 'package:advancednews/home/views/functions/dark_theme_app.dart';
import 'package:advancednews/home/views/functions/light_theme.dart';
import 'package:advancednews/home/views/home_page_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isDark = await CacheHelper.getBool('isDark') ?? false;
  runApp(NewsApp(isDark: isDark));
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key, required this.isDark});
  final bool isDark;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BottomNavCubit()..changeAppMode(fromShard: isDark)),
        BlocProvider(create: (context) => ApiServersCubit(ApiService(Dio()))),
      ],
      child: BlocBuilder<BottomNavCubit, BottomNavState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const HomePage(),
            theme: lightTheme(),
            darkTheme: darkThemeApp(),
            themeMode: BottomNavCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
          );
        },
      ),
    );
  }
}
