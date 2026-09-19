import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tthakkr_app/features/prayer_time_feature/bloc/prayer_time_bloc.dart';

class ClockCardWidget extends StatelessWidget {
  const ClockCardWidget({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 25,
          crossAxisAlignment: .start,
          children: [
            Center(
              child: BlocBuilder<PrayerTimeBloc, PrayerTimeState>(
                builder: (context, state) {
                  if (state is ClockUpdate) {
                    return Text(
                    DateFormat('hh:mm:ss a').format(state.currentTime),
                    style: TextStyle(fontSize: 30),
                  );
                  }
                  return Text(
                    DateFormat('hh:mm:ss a').format(DateTime.now()),
                    style: TextStyle(fontSize: 30),
                  );
                },
              ),
            ),
            Text(
              DateFormat('E dd MMMM, yyyy').format(DateTime.now()),
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
