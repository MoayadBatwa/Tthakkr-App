part of 'athkar_bloc.dart';

@immutable
sealed class AthkarState {}

final class AthkarInitial extends AthkarState {}

final class AthkarLoaded extends AthkarState {
  final List<AzkarItem> athkarList;

  AthkarLoaded({required this.athkarList});
}

final class AthkarError extends AthkarState {}