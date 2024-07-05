import 'package:advancednews/home/controller/cubit_api_server/api_servers_cubit.dart';
import 'package:advancednews/home/views/widgets/news_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryNewsView extends StatefulWidget {
  const CategoryNewsView({super.key, required this.category});
  final String category;
  @override
  State<CategoryNewsView> createState() => _CategoryNewsViewState();
}

class _CategoryNewsViewState extends State<CategoryNewsView> {
  @override
  void initState() {
    ApiServersCubit.get(context).getNews(category: widget.category);
    setState(() {});
    super.initState();
  }

  void didUpdateWidget(covariant CategoryNewsView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.category != widget.category) {
      _fetchNews();
    }
  }

  void _fetchNews() {
    ApiServersCubit.get(context).getNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApiServersCubit, ApiServersState>(
      builder: (context, state) {
        if (state is CategoryNewSuccess) {
          return NewsFormWidget(
            news: state.news,
          );
        } else if (state is CategoryNewsFailure) {
          print(state.errMessage);
          return Center(
            child: Text('Error: ${state.errMessage}'),
          );
        } else if (state is CategoryNewsLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.deepOrange,
            ),
          );
        }
        return const Text('data');
      },
    );
  }
}
