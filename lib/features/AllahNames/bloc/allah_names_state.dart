part of 'allah_names_bloc.dart';

@immutable
sealed class AllahNamesState {}

final class AllahNamesInitial extends AllahNamesState {}

final class LoadedState extends AllahNamesState {
  final List<NameOfAllah> AllahNames;

  LoadedState({required this.AllahNames});
}

final class ErrorState extends AllahNamesState {}