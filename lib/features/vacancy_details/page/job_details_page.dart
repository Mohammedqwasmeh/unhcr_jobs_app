import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:unhcr_jobs_app/core/constant/colors.dart';
import 'package:unhcr_jobs_app/core/widgets/UNHCRJobs_app_bar.dart';
import 'package:unhcr_jobs_app/features/home/model/job.dart';

class JobDetailsPage extends StatelessWidget {
  JobDetailsPage({required this.job, super.key});

  Job job;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const UNHCRJobsAppBar(
          showBackButton: true,
          title: 'Job Details',
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Job ID: ${job.jobId}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey[400],
                  ),
                ),
                Text(
                  job.location,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            buildImageWidget(job.imageUrl),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  job.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Text(
              job.salary,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Text(
                  job.company,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.turquoise[600],
                      decoration: TextDecoration.underline),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  job.description,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  job.longDescription,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  Widget buildImageWidget(String imageUrl) {
    return imageUrl.isNotEmpty
        ? Image.network(
            imageUrl,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Shimmer.fromColors(
                baseColor: AppColors.turquoise[900]!.withOpacity(0.3),
                highlightColor: AppColors.turquoise[500]!,
                period: const Duration(milliseconds: 800),
                child: Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
              );
            },
          )
        : Image.asset(
            'assets/images/empty.jpg',
            fit: BoxFit.cover,
          );
  }
}
