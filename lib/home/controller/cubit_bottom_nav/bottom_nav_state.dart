part of 'bottom_nav_cubit.dart';

@immutable
sealed class BottomNavState {}

final class BottomNavInitial extends BottomNavState {}

final class BottomNavChange extends BottomNavState {}
final class ChangeAppMode extends BottomNavState {}
