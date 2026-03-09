part of 'athkar_bloc.dart';

@immutable
sealed class AthkarEvent {}

final class AthkarLoadEvent extends AthkarEvent {
  final int chapterId;

  AthkarLoadEvent({required this.chapterId});
}
