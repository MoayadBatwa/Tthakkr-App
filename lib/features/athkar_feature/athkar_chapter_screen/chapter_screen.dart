import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tthakkr_app/core/navigation/route_name.dart';
import 'package:tthakkr_app/features/athkar_feature/athkar_chapter_screen/bloc/chapter_bloc.dart';
import 'package:tthakkr_app/common%20widget/reload_button_widget.dart';

class ChapterScreen extends StatelessWidget {
  const ChapterScreen({super.key, required this.categoryId});
  final int categoryId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          ChapterBloc()..add(ChapterLoadEvent(categoryId: categoryId)),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Athkar Chapters'),
              centerTitle: true,
              elevation: 0,
              scrolledUnderElevation: 0,
              actionsPadding: EdgeInsets.symmetric(horizontal: 16),
              actions: [
                Tooltip(
                  message: 'Choose a chapter',
                  triggerMode: .tap,
                  child: Icon(Icons.help),
                ),
              ],
            ),
            body: BlocBuilder<ChapterBloc, ChapterState>(
              builder: (context, state) {
                if (state is ChapterInitial) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is ChapterLoaded) {
                  return ListView.builder(
                    padding: EdgeInsets.all(16),
                    itemCount: state.chapterList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          'Thikr chapter: ${state.chapterList[index].name}',
                        ),
                        trailing: Icon(Icons.arrow_forward),
                        onTap: () => context.push(
                          RouteName.toItemScreenPath(
                            categoryId,
                            state.chapterList[index].id,
                          ),
                        ),
                      );
                    },
                  );
                }
                return ReloadButtonWidget(
                  function: () => context.read<ChapterBloc>().add(
                    ChapterLoadEvent(categoryId: categoryId),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
