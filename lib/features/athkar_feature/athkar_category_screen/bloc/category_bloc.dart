import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:muslim_data_flutter/muslim_data_flutter.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final MuslimRepository repo = MuslimRepository();

  CategoryBloc() : super(CategoryInitial()) {
    on<CategoryLoadEvent>((event, emit) async {
      await repo
          .getAzkarCategories()
          .then((azkarList) {
            if (azkarList.isEmpty) throw Exception();
            emit(CategoryLoaded(categoryList: azkarList));
          })
          .onError((error, stackTrace) {
            log('Category Bloc Error: $error');
            emit(CategoryError());
          });
    });
  }
}
