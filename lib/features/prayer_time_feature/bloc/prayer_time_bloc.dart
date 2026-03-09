import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:muslim_data_flutter/muslim_data_flutter.dart';

part 'prayer_time_event.dart';
part 'prayer_time_state.dart';

class PrayerTimeBloc extends Bloc<PrayerTimeEvent, PrayerTimeState> {
  PrayerTimeBloc() : super(PrayerTimeInitial()) {
    final MuslimRepository repo = MuslimRepository();

    on<PrayerTimeStart>((event, emit) async {
      final currentLocation = await repo.searchLocations(
        locationName: 'Jeddah',
      );
      await repo
          .getPrayerTimes(
            location: currentLocation[0],
            date: DateTime.now(),
            attribute: PrayerAttribute(),
          )
          .then((value) {
            emit(PrayerTimeLoaded(prayerTimes: value!));
          })
          .onError((error, stackTrace) {
            log('prayer times load error: $error');
            emit(PrayerTimeError());
          });

      Timer.periodic(
        const Duration(seconds: 1),
        (_) => add(UpdateClock(currentTime: DateTime.now())),
      );
    });

    on<UpdateClock>((event, emit) {
      emit(ClockUpdate(currentTime: event.currentTime));
    });
  }
}
