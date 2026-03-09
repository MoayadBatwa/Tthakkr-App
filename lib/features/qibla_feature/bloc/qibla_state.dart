part of 'qibla_bloc.dart';

@immutable
sealed class QiblaState {}

final class QiblaInitial extends QiblaState {}

final class QiblaSuccess extends QiblaState {
  final QiblahDirection direction;

  QiblaSuccess({required this.direction});
}

final class QiblaError extends QiblaState {
  final String error;

  QiblaError({required this.error});
}
