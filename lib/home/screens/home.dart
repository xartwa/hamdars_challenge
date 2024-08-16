// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hamdars/core/utils/debouncer.dart';
import 'package:hamdars/core/widgets/error_handler.dart';
import '../bloc/home_bloc.dart';
import '../services/home.dart';
import '../widgets/chapter_loading.dart';
import '../widgets/lessons_loading.dart';
import 'package:svg_flutter/svg_flutter.dart';
import '../../core/theme.dart';
import '../widgets/bottom_curve_shpe.dart';
import '../widgets/chapter_card.dart';
import '../widgets/chapter_circular_progress_indicator.dart';
import '../widgets/lesson_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController =
      PageController(viewportFraction: 0.25, initialPage: 2);
  final ValueNotifier<int> selectedIndexNotifier = ValueNotifier<int>(2);
  bool isFirstBuild = true;

  void _changeSelectedValue(int index, String uuid, BuildContext context) {
    if (index != selectedIndexNotifier.value) {
      selectedIndexNotifier.value = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      BlocProvider.of<HomeBloc>(context).add(FetchChapterEvent(uuid: uuid));
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    selectedIndexNotifier.dispose();
    Debouncer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeBloc(
          homeServices: GetIt.instance<HomeServices>(),
        )..add(FetchLessonsEvent()),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, chapterState) {
                  if (chapterState is GetChaptersSuccess) {
                    return ListView.builder(
                      padding: const EdgeInsets.only(
                          left: 18.0, right: 18.0, bottom: 40.0, top: 60.0),
                      itemCount: chapterState.chapters.length,
                      itemBuilder: (context, index) {
                        return ChapterCardItem(
                            chapterItem: chapterState.chapters[index]);
                      },
                    );
                  } else if (chapterState is GetChaptersError) {
                    return Center(child: Text('Error ${chapterState.error}'));
                  } else {
                    return chapterLoading(context, customProgressIndicator());
                  }
                },
              ),
            ),
            //! CURVE - LESSON - SPINNER
            CustomPaint(
              painter: BottomCurvePainter(),
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: 200.0,
                child: BlocConsumer<HomeBloc, HomeState>(
                  buildWhen: (previous, current) {
                    if (current is GetLessonsSuccess ||
                        current is GetLessonsError ||
                        (current is GetLessonsLoading && isFirstBuild)) {
                      return true;
                    }
                    return false;
                  },
                  listener: (context, state) {
                    if (state is GetLessonsSuccess) {
                      isFirstBuild = false;
                      Debouncer.run(
                        milliseconds: 1000,
                        () => BlocProvider.of<HomeBloc>(context).add(
                          FetchChapterEvent(
                              uuid: state
                                      .lessonModel[selectedIndexNotifier.value]
                                      .id ??
                                  ""),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is GetLessonsSuccess) {
                      return _buildPageView(state, context);
                    } else if (state is GetLessonsError) {
                      return ErrorHandlerButton(
                          errorMessage: 'ارتباط با سرور برقرار نشد ...',
                          onRetry: () => BlocProvider.of<HomeBloc>(context).add(
                                FetchLessonsEvent(),
                              ));
                    } else if (state is GetLessonsLoading) {
                      return LessonsLoading();
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: customFloatingButton(),
    );
  }

  Widget customFloatingButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Material(
        color: Colors.white,
        elevation: 1.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                minimumSize: const Size(150.0, 65.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                elevation: 0.0,
                shadowColor: Colors.transparent,
                backgroundColor: AppColors.secondaryTeal.withOpacity(0.10),
                foregroundColor: AppColors.darkTeal),
            onPressed:   (){},
            label: const Text(
              'طراحی سوال',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            icon: SvgPicture.asset(
              'assets/icons/teacher.svg',
              width: 30.0,
            )),
      ),
    );
  }

//! BOTTOM - SECTION
  Widget _buildPageView(GetLessonsSuccess state, BuildContext blocContext) {
    return PageView.builder(
      pageSnapping: false,
      controller: _pageController,
      itemCount: state.lessonModel.length,
      onPageChanged: (index) {
        selectedIndexNotifier.value = index;
        Debouncer.run(
          milliseconds: 1000,
          () => BlocProvider.of<HomeBloc>(blocContext).add(
            FetchChapterEvent(uuid: state.lessonModel[index].id ?? ""),
          ),
        );
      },
      itemBuilder: (context, index) {
        var lessonItem = state.lessonModel[index];
        return ValueListenableBuilder<int>(
          valueListenable: selectedIndexNotifier,
          builder: (context, selectedIndex, _) {
            return GestureDetector(
              onTap: () {
                _changeSelectedValue(index, lessonItem.id ?? "", context);
              },
              child: LessonItem(
                  lessonItem: lessonItem,
                  index: index,
                  selectedIndex: selectedIndex),
            );
          },
        );
      },
    );
  }
}
