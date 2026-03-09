import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tthakkr_app/core/navigation/route_name.dart';
import 'package:tthakkr_app/features/athkar_feature/athkar_category_screen/bloc/category_bloc.dart';
import 'package:tthakkr_app/common%20widget/reload_button_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoryBloc()..add(CategoryLoadEvent()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Athkar Category'),
              centerTitle: true,
              elevation: 0,
              scrolledUnderElevation: 0,
              actionsPadding: EdgeInsets.symmetric(horizontal: 16),
              actions: [
                Tooltip(
                  message: 'Choose a category',
                  triggerMode: .tap,
                  child: Icon(Icons.help),
                ),
              ],
            ),
            body: BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryInitial) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is CategoryLoaded) {
                  return GridView.builder(
                    padding: EdgeInsets.all(16),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.6,
                    ),
                    itemCount: state.categoryList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => context.push(
                          RouteName.toChapterScreenPath(
                            state.categoryList[index].id,
                          ),
                        ),
                        child: Card(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: .spaceEvenly,
                              children: [
                                Text('Athkar'),
                                Text(state.categoryList[index].name),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                return ReloadButtonWidget(
                  function: () =>
                      context.read<CategoryBloc>().add(CategoryLoadEvent()),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
