import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:unhcr_jobs_app/core/constant/colors.dart';
import 'package:unhcr_jobs_app/core/routes/router.gr.dart';
import 'package:unhcr_jobs_app/features/home/model/job.dart';

class JobListItem extends StatefulWidget {
  const JobListItem({
    required this.job,
    this.isHistory = false,
    super.key,
  });

  final Job job;
  final bool isHistory;

  @override
  State<JobListItem> createState() => _JobListItemState();
}

class _JobListItemState extends State<JobListItem> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: goToJobDetails,
        onTapDown: (_) => setState(() => isPressed = true),
        onTapCancel: () => setState(() => isPressed = false),
        onTapUp: (_) => setState(() => isPressed = false),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                color:
                    AppColors.black[600]!.withOpacity(isPressed ? 0.25 : 0.10),
                spreadRadius: isPressed ? 7 : 4,
                blurRadius: isPressed ? 10 : 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          buildImageWidget(widget.job.imageUrl),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 16,
                              left: 16,
                              top: 8,
                              bottom: 16,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.job.title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      widget.job.datePosted,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  widget.job.company,
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
                                  widget.job.description,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImageWidget(String imageUrl) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      child: imageUrl.isNotEmpty
          ? Image.network(
              imageUrl,
              fit: BoxFit.fitWidth,
              height: 200,
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
            ),
    );
  }

  void goToJobDetails() {
    context.router.push(JobDetailsRoute(job: widget.job));
  }
}
