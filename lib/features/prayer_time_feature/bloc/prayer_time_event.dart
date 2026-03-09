part of 'prayer_time_bloc.dart';

@immutable
sealed class PrayerTimeEvent {}

final class PrayerTimeStart extends PrayerTimeEvent {}

final class UpdateClock extends PrayerTimeEvent {
  final DateTime currentTime;

  UpdateClock({required this.currentTime});
}
