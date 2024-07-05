import 'package:advancednews/home/controller/cubit_api_server/api_servers_cubit.dart';
import 'package:advancednews/home/views/widgets/news_form_widget.dart';
import 'package:advancednews/home/views/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApiServersCubit, ApiServersState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: textFormFieldWidget(
                    onChanged: (value) {
                      ApiServersCubit.get(context)
                          .getNewsEverything(search: value);
                    },
                    suffixIcon: Icons.search,
                    hintText: 'Search',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'the field is requerd';
                      }
                      return null;
                    },
                    prefixIcon: Icons.arrow_back,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                if (state is ApiServersSuccess)
                  Expanded(child: NewsFormWidget(news: state.news)),
                
              ],
            ),
          ),
        );
      },
    );
  }
}
