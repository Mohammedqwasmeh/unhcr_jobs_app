import 'package:flutter/material.dart';
import 'package:unhcr_jobs_app/core/constant/colors.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Center(
        child: CircularProgressIndicator(
          color: AppColors.turquoise[500],
          strokeWidth: 3,
        ),
      );
}
