
import 'package:bloc/bloc.dart';
import '../models/lesson.dart';
import '../models/chapter.dart';
import '../services/home.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeServices homeServices;
  
  HomeBloc({required this.homeServices}) : super(HomeInitial()) {
    on<FetchLessonsEvent>(_oFetchLessonBlocEvent);
    on<FetchChapterEvent>(_onFetchChapterEvent);
  }

  Future<void> _oFetchLessonBlocEvent(FetchLessonsEvent event, Emitter<HomeState> emit) async {
    emit(GetLessonsLoading());
    try {
      var response = await homeServices.fetchLessonData();
      emit(GetLessonsSuccess(lessonModel: response));
    } catch (e) {
      
      emit(GetLessonsError(error: e.toString()));
    }
  }

  Future<void> _onFetchChapterEvent(FetchChapterEvent event, Emitter<HomeState> emit) async {
    emit(GetChaptersLoading());
    try {
      List<Chapter> chapters = Chapter.filterChaptersByUuid(event.uuid);
      if (chapters.isNotEmpty) {
        emit(GetChaptersSuccess(chapters: chapters));
      } else {
        emit(GetChaptersError("No chapters found!"));
      }
    } catch (e) {
      emit(GetChaptersError("An error occurred: $e"));
    }
  }
}
