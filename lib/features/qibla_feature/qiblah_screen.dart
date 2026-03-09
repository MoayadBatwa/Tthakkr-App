import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tthakkr_app/core/constants/app_colors.dart';
import 'package:tthakkr_app/features/qibla_feature/bloc/qibla_bloc.dart';
import 'package:tthakkr_app/features/qibla_feature/widget/location_error_widget.dart';
import 'package:tthakkr_app/features/qibla_feature/widget/qibla_compass_widget.dart';

class QiblahScreen extends StatelessWidget {
  const QiblahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => QiblaBloc()..add(QiblaStartEvent()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Qibla'),
              centerTitle: true,
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: BlocBuilder<QiblaBloc, QiblaState>(
                builder: (context, state) {
                  if (state is QiblaInitial) {
                    Center(
                      child: CircularProgressIndicator(
                        color: AppColors.gold,
                      ),
                    );
                  }
                  if (state is QiblaSuccess) {
                    return QiblaCompassWidget(qiblah: state.direction);
                  }
                  if (state is QiblaError) {
                    return LocationErrorWidget(
                      callback: () => context.read<QiblaBloc>().add(
                        RequestPermissionEvent(),
                      ),
                      error: state.error,
                    );
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
