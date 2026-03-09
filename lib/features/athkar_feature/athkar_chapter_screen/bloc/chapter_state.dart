part of 'chapter_bloc.dart';

@immutable
sealed class ChapterState {}

final class ChapterInitial extends ChapterState {}

final class ChapterLoaded extends ChapterState {
  final List<AzkarChapter> chapterList;

  ChapterLoaded({required this.chapterList});
}

final class ChapterError extends ChapterState {}
