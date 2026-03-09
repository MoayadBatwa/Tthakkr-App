part of 'prayer_time_bloc.dart';

@immutable
sealed class PrayerTimeState {}

final class PrayerTimeInitial extends PrayerTimeState {}

final class PrayerTimeLoaded extends PrayerTimeState {
  final PrayerTime prayerTimes;

  PrayerTimeLoaded({required this.prayerTimes});
}

final class PrayerTimeError extends PrayerTimeState {}


final class ClockUpdate extends PrayerTimeState {
  final DateTime currentTime;

  ClockUpdate({required this.currentTime});
}
