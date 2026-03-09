import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tthakkr_app/core/constants/app_colors.dart';
import 'package:tthakkr_app/features/athkar_feature/athkar_screen/bloc/athkar_bloc.dart';
import 'package:tthakkr_app/common%20widget/reload_button_widget.dart';

class AthkarScreen extends StatelessWidget {
  const AthkarScreen({super.key, required this.chapterId});
  final int chapterId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AthkarBloc()..add(AthkarLoadEvent(chapterId: chapterId)),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Athkar'),
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
            body: BlocBuilder<AthkarBloc, AthkarState>(
              builder: (context, state) {
                if (state is AthkarInitial) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is AthkarLoaded) {
                  return ListView.separated(
                    padding: EdgeInsets.all(16),
                    itemCount: state.athkarList.length,
                    separatorBuilder: (context, index) => SizedBox(height: 15),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: AppColors.card,
                          border: Border.all(
                            color: AppColors.goldBorder,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ListTile(
                          title: Text.rich(
                            style: TextStyle(fontSize: 20),
                            textDirection: .rtl,
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '${state.athkarList[index].item}\n',
                                ),
                                TextSpan(
                                  text: state.athkarList[index].translation,
                                ),
                              ],
                            ),
                          ),
                          subtitle: Text(state.athkarList[index].reference),
                        ),
                      );
                    },
                  );
                }
                return ReloadButtonWidget(
                  function: () => context.read<AthkarBloc>().add(
                    AthkarLoadEvent(chapterId: chapterId),
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
