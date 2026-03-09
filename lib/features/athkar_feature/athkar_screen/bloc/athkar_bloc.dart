import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:muslim_data_flutter/muslim_data_flutter.dart';

part 'athkar_event.dart';
part 'athkar_state.dart';

class AthkarBloc extends Bloc<AthkarEvent, AthkarState> {
  final MuslimRepository repo = MuslimRepository();

  AthkarBloc() : super(AthkarInitial()) {
    on<AthkarLoadEvent>((event, emit) async {
      await repo
          .getAzkarItems(chapterId: event.chapterId, language: .en)
          .then((athkarList) {
            if (athkarList.isEmpty) throw Exception();
            emit(AthkarLoaded(athkarList: athkarList));
          })
          .onError((error, stackTrace) {
            log('Category Bloc Error: $error');
            emit(AthkarError());
          });
    });
  }
}
