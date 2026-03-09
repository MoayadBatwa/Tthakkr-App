part of 'chapter_bloc.dart';

@immutable
sealed class ChapterEvent {}

final class ChapterLoadEvent extends ChapterEvent {
  final int categoryId;

  ChapterLoadEvent({required this.categoryId});
}
