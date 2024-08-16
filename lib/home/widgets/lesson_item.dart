import 'package:cached_network_svg_image/cached_network_svg_image.dart';
import 'package:flutter/material.dart';
import '../models/lesson.dart';
import '../../core/theme.dart';

class LessonItem extends StatelessWidget {
  const LessonItem(
      {super.key,
      required this.selectedIndex,
      required this.index,
      required this.lessonItem});
  final int selectedIndex;
  final int index;
  final LessonModel lessonItem;
  bool get currentIndex => selectedIndex == index;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
        color: currentIndex
            ? AppColors.primaryBlue.withOpacity(.06)
            : Colors.transparent,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(75.0)),
      ),
      child: Column(
        children: [
          Transform.scale(
            scale: currentIndex ? 1 : 0.6,
            child: Stack(
              alignment: Alignment.center,
              children: [
                //! USER - UNIT - PROGRESS
                CircularProgressIndicator(
                    value: currentIndex
                        ? (lessonItem.hamdarsUserCurrentUnitLevelPoint! -
                                lessonItem.hamdarsUserMinUnitLevelPoint!) /
                            (lessonItem.hamdarsUserMaxUnitLevelPoint! -
                                lessonItem.hamdarsUserMinUnitLevelPoint!)
                        : 0.0,
                    strokeAlign: 7.0,
                    strokeCap: StrokeCap.round,
                    backgroundColor: AppColors.lightGray ,
                    strokeWidth: 7.0,
                    color: AppColors.primaryBlue),
             //! UNIT - ICON
                CachedNetworkSVGImage(
                  lessonItem.unitIcon!,
                  width: 75.0,
                  placeholder: const CircleAvatar(
                      radius: 35, backgroundColor: AppColors.lightestGray),
                  errorWidget: const CircleAvatar(
                    radius: 35,
                    backgroundColor: AppColors.lightestGray,
                    foregroundColor: AppColors.primaryBlue,
                    child: Icon(
                      Icons.error_outlined,
                      size: 30.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          !currentIndex
              ? const SizedBox()
              : Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, right: 6.0, left: 6.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Card(
                        semanticContainer: true,
                        elevation: 0.0,
                        color: AppColors.accentYellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 2.0),
                          child: Text(
                            'سطح ${lessonItem.hamdarsUserCurrentUnitLevelPoint}',
                            style: const TextStyle(
                                fontSize: 10.0, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Tooltip(
                        message: lessonItem.name ?? '',
                        height: 40.0,
                        decoration: BoxDecoration(
                            color: AppColors.darkGray,
                            borderRadius: BorderRadius.circular(50.0)),
                        child: Text(
                          lessonItem.name ?? '',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 14.0),
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
