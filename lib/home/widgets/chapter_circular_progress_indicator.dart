import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../core/theme.dart';

Widget customProgressIndicator({final double value = 0.0}) {
      return  Stack(
          alignment: Alignment.center,
          children: [
            CircularProgressIndicator(
                value: value,
                strokeAlign: 6,
                strokeCap: StrokeCap.round,
                backgroundColor: AppColors.lightestGray,
                strokeWidth: 6,
                color: AppColors.accentYellow),
            Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.2),
                    blurRadius: 20,
                    spreadRadius: .2,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: SvgPicture.asset('assets/icons/chapter_book.svg'),
              ),
            ),
          ],
        );
    }
