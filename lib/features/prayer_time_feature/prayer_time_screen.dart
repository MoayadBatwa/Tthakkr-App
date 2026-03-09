import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tthakkr_app/core/Extensions/date_time_extension.dart';
import 'package:tthakkr_app/core/constants/app_colors.dart';
import 'package:tthakkr_app/features/prayer_time_feature/bloc/prayer_time_bloc.dart';
import 'package:tthakkr_app/features/prayer_time_feature/widgets/clock_card_widget.dart';

class PrayerTimeScreen extends StatelessWidget {
  const PrayerTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PrayerTimeBloc()..add(PrayerTimeStart()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Prayer Times'),
              centerTitle: true,
              elevation: 0,
              scrolledUnderElevation: 0,
              actionsPadding: EdgeInsets.symmetric(horizontal: 16),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                spacing: 15,
                children: [
                  ClockCardWidget(),
                  Card(
                    child: BlocBuilder<PrayerTimeBloc, PrayerTimeState>(
                      buildWhen: (previous, current) =>
                          current is PrayerTimeInitial
                          ? true
                          : current is PrayerTimeLoaded
                          ? true
                          : false,
                      builder: (context, state) {
                        if (state is PrayerTimeInitial) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (state is PrayerTimeLoaded) {
                          final List<String> prayerName = [
                            'Al Fajer',
                            'Al Shurooq',
                            'Al Dhuhur',
                            'Al Asur',
                            'Al Maghtib',
                            'Al Isha',
                          ];
                          return ListView.separated(
                            padding: EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 16,
                            ),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment: .spaceBetween,
                                children: [
                                  Text(prayerName[index]),
                                  Text(state.prayerTimes[index].prayerTime()),
                                ],
                              );
                            },
                            separatorBuilder: (context, index) =>
                                Divider(height: 25, color: AppColors.ishaColor),
                            itemCount: 6, //(state.prayerTimes as List).length,
                          );
                        }

                        return Center(child: Text('Error Loading'));
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
