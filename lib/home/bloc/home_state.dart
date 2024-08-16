part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}


class GetLessonsSuccess extends HomeState {
final List<LessonModel>  lessonModel ;
  GetLessonsSuccess({required this.lessonModel});
}


class GetLessonsError extends HomeState {
  final String error ; 

  GetLessonsError({required this.error});
}

class GetLessonsLoading extends HomeState {}


class GetChaptersSuccess extends HomeState {
    final List<Chapter> chapters;

   GetChaptersSuccess({required this.chapters});
}

class GetChaptersLoading extends HomeState {}

class GetChaptersError extends HomeState { 
  final String error;  
  GetChaptersError( this.error);
}