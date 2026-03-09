part of 'qibla_bloc.dart';

@immutable
sealed class QiblaEvent {}

final class QiblaStartEvent extends QiblaEvent {}

class UpdateQiblaDirection extends QiblaEvent {
  final QiblahDirection direction;

  UpdateQiblaDirection({required this.direction});
}

final class RequestPermissionEvent extends QiblaEvent {}
