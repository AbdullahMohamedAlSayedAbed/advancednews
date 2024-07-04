part of 'api_servers_cubit.dart';

@immutable
sealed class ApiServersState {}

final class ApiServersInitial extends ApiServersState {}

final class ApiServersLoading extends ApiServersState {}

final class ApiServersSuccess extends ApiServersState {
  final List<ArticleModel> news;

  ApiServersSuccess({required this.news});
}

final class ApiServersFailure extends ApiServersState {
  final String errMessage;

  ApiServersFailure({required this.errMessage});
}

final class CategoryNewsLoading extends ApiServersState {}

final class CategoryNewSuccess extends ApiServersState {
  final List<ArticleModel> news;

  CategoryNewSuccess({required this.news});
}

final class CategoryNewsFailure extends ApiServersState {
  final String errMessage;

  CategoryNewsFailure({required this.errMessage});
}
