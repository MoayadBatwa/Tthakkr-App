part of 'category_bloc.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryLoaded extends CategoryState {
  final List<AzkarCategory> categoryList;

  CategoryLoaded({required this.categoryList});
}

final class CategoryError extends CategoryState {}
