import 'package:flutter/material.dart';
import '../../core/theme.dart';

class LessonsLoading extends StatelessWidget {
  final ValueNotifier<int> selectedIndexNotifier = ValueNotifier(2);
  final PageController pageController =
      PageController(viewportFraction: 0.25, initialPage: 2);

  LessonsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      onPageChanged: (value) {
        selectedIndexNotifier.value = value;
      },
      itemCount: 10,
      itemBuilder: (context, index) {
        return ValueListenableBuilder<int>(
          valueListenable: selectedIndexNotifier,
          builder: (context, selectedIndex, child) {
            bool currentIndex = selectedIndex == index;
            return Container(
              decoration: BoxDecoration(
                color: currentIndex
                    ? AppColors.primaryBlue.withOpacity(.07)
                    : Colors.transparent,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(75.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Transform.scale(
                    scale: currentIndex ? 1.0 : 0.6,
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      width: 95.0,
                      height: 95.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.lightGray,
                          width: 7.0,
                        ),
                      ),
                      child: const CircleAvatar(
                        backgroundColor: Color(0XFFF0F0F0),
                      ),
                    ),
                  ),
                  !currentIndex
                      ? const SizedBox()
                      : Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          height: 20,
                          width: 60,
                          decoration: BoxDecoration(
                            color: AppColors.primaryBlue.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
