import 'package:advancednews/home/controller/cubit_api_server/api_servers_cubit.dart';
import 'package:advancednews/home/views/widgets/news_form_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class EveryThingView extends StatefulWidget {
  const EveryThingView({super.key});

  @override
  State<EveryThingView> createState() => _EveryThingViewState();
}

class _EveryThingViewState extends State<EveryThingView> {
  @override
  void initState() {
    ApiServersCubit.get(context).getNewsEverything(search: 'bitcoin');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApiServersCubit, ApiServersState>(
      builder: (context, state) {
        if (state is ApiServersSuccess) {
          return NewsFormWidget(
            news: state.news,
          );
        } else if (state is ApiServersFailure) {
          return Center(
            child: Text('Error: ${state.errMessage}'),
          );
        } else if (state is ApiServersLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.deepOrange,),
          );
        }
        return const Text('data');
      },
    );
  }
}
