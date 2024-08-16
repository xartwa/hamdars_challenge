import 'package:flutter/material.dart';

import '../theme.dart';

class ErrorHandlerButton extends StatelessWidget {
  const ErrorHandlerButton(
      {super.key, required this.errorMessage, required this.onRetry});
  final String errorMessage;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Text(
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              errorMessage,
              style: const TextStyle(
                  color: Color(0XFF4A4A4A),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 50.0,
            width: MediaQuery.sizeOf(context).width * 0.5,
            child: OutlinedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColors.primaryBlue,
                side: const BorderSide(color: AppColors.primaryBlue, width: 2.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
              ),
              onPressed: onRetry,
              child: const Text(
                "تلاش مجدد",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
    );
  }
}
