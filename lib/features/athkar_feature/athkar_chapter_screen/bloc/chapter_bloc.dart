import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:muslim_data_flutter/muslim_data_flutter.dart';

part 'chapter_event.dart';
part 'chapter_state.dart';

class ChapterBloc extends Bloc<ChapterEvent, ChapterState> {
  final MuslimRepository repo = MuslimRepository();

  ChapterBloc() : super(ChapterInitial()) {
    on<ChapterLoadEvent>((event, emit) async {
      await repo
          .getAzkarChapters(categoryId: event.categoryId)
          .then((chapterList) {
            if (chapterList.isEmpty) throw Exception();
            emit(ChapterLoaded(chapterList: chapterList));
          })
          .onError((error, stackTrace) {
            log('Category Bloc Error: $error');
            emit(ChapterError());
          });
    });
  }
}
