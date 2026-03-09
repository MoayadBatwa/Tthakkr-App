
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:muslim_data_flutter/muslim_data_flutter.dart';

part 'allah_names_event.dart';
part 'allah_names_state.dart';

class AllahNamesBloc extends Bloc<AllahNamesEvent, AllahNamesState> {
  final muslimRepo = MuslimRepository();

  AllahNamesBloc() : super(AllahNamesInitial()) {
    on<GetAllahNamesEvent>((event, emit) async {
      final List<NameOfAllah> AllahNames; 
      try{
      AllahNames = await muslimRepo.getNames(language: .en);
      } catch (e) {
        emit(ErrorState());
        return;
      }

      

      emit(LoadedState(AllahNames: AllahNames));
    });
  }
}
