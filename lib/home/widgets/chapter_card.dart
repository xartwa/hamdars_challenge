import 'package:flutter/material.dart';
import 'chapter_circular_progress_indicator.dart';
import '../models/chapter.dart';
import '../../core/theme.dart';
import 'package:svg_flutter/svg.dart';

class ChapterCardItem extends StatelessWidget {
  final Chapter chapterItem;

  const ChapterCardItem({super.key, required this.chapterItem});

  @override
  Widget build(BuildContext context) {
//? Formats a [Duration] object into a string representation in the format "MM:SS".
    String formatDuration(Duration duration) {
      String twoDigits(int n) => n.toString().padLeft(2, '0');
      String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
      String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
      return '$twoDigitMinutes:$twoDigitSeconds';
    }

    return Row(
      children: [
        customProgressIndicator(
          value: chapterItem.progress,
        ),
        const SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Container(
            height: 85,
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withOpacity(.08),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chapterItem.title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/duration.svg',
                            width: 18.0,
                            colorFilter: const ColorFilter.mode(
                                AppColors.darkGray, BlendMode.srcIn),
                          ),
                          const SizedBox(width: 10.0),
                          Text(
                            formatDuration(chapterItem.duration),
                            style: const TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: AppColors.darkGray),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColors.darkGray,
                  size: 18.0,
                  weight: 10,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
