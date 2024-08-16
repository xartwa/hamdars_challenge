part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class FetchLessonsEvent extends HomeEvent {}

class FetchChapterEvent extends HomeEvent  {
   final String uuid ; 
 FetchChapterEvent({required this.uuid});
}