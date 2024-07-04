import 'package:advancednews/home/data/api_service.dart';
import 'package:advancednews/home/data/models/news_model/article.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'api_servers_state.dart';

class ApiServersCubit extends Cubit<ApiServersState> {
  ApiServersCubit(this.apiService) : super(ApiServersInitial());
  static ApiServersCubit get(context) => BlocProvider.of(context);
  final ApiService apiService;
  Future<void> getNewsEverything({required String search}) async {
    List<ArticleModel> news = [];
    emit(ApiServersLoading());
    try {
      var data = await apiService.getEverything(search: search);
      for (var item in data['articles']) {
        news.add(ArticleModel.fromJson(item));
      }
      emit(ApiServersSuccess(news: news));
    } catch (e) {
      return emit(ApiServersFailure(errMessage: e.toString()));
    }
  }
  Future<void> getNews({required String category}) async {
    List<ArticleModel> news = [];
    emit(CategoryNewsLoading());
    try {
      var data = await apiService.get(category: category);
      for (var item in data['articles']) {
        news.add(ArticleModel.fromJson(item));
      }
      emit(CategoryNewSuccess(news: news));
    } catch (e) {
      return emit(CategoryNewsFailure(errMessage: e.toString()));
    }
  }
}

