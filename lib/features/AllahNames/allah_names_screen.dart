import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tthakkr_app/features/AllahNames/bloc/allah_names_bloc.dart';
import 'package:tthakkr_app/features/AllahNames/widgets/allah_names_widget.dart';

class AllahNamesScreen extends StatelessWidget {
  const AllahNamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AllahNamesBloc(),
      child: Builder(
        builder: (context) {
          context.read<AllahNamesBloc>().add(GetAllahNamesEvent());

          return Scaffold(
            appBar: AppBar(
              title: Text('Allah Names'),
              centerTitle: true,
              elevation: 0,
              scrolledUnderElevation: 0,
              actionsPadding: EdgeInsets.symmetric(horizontal: 16),
            ),

            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<AllahNamesBloc, AllahNamesState>(
                buildWhen: (previous, current) {
                  if (current is AllahNamesInitial) {
                    return true;
                  }

                  if (current is LoadedState) {
                    return true;
                  }

                  if (current is ErrorState) {
                    return true;
                  }

                  return false;
                },

                builder: (context, state) {
                  if (state is AllahNamesInitial) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (state is LoadedState) {
                    return GridView.builder(
                      shrinkWrap: false,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.8,
                      ),
                      itemBuilder: (context, index) {
                        return AllahNamesWidget(
                          allahName: state.AllahNames[index].name.toString(),
                          nameTranslation: state.AllahNames[index].translation
                              .toString(),
                        );
                      },
                    );

                    /* ListView.separated(
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10),
                      shrinkWrap: true,
                      primary: false,
                      itemCount: state.AllahNames.length,
                      itemBuilder: (context, index) {
                        return AllahNamesWidget(
                          allahName: state.AllahNames[index].name
                              .toString(),
                          nameTranslation: state
                              .AllahNames[index]
                              .translation
                              .toString(),
                        );
                      },
                    ); */
                  }

                  return SizedBox.shrink();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
