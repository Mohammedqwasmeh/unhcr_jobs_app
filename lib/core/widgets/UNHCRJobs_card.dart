import 'package:unhcr_jobs_app/core/constant/colors.dart';
import 'package:unhcr_jobs_app/core/widgets/UNHCRJobs_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UNHCRJobsCard extends StatefulWidget {
  const UNHCRJobsCard({
    required this.imagePath,
    super.key,
    this.title,
    this.body,
    this.subtitle,
    this.buttonTitle,
    this.onButtonPressed,
    this.onCardPressed,
  });

  final String imagePath;
  final String? title;
  final Widget? body;
  final String? subtitle;
  final String? buttonTitle;
  final VoidCallback? onCardPressed;
  final VoidCallback? onButtonPressed;

  @override
  _UNHCRJobsCardState createState() => _UNHCRJobsCardState();
}

class _UNHCRJobsCardState extends State<UNHCRJobsCard> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onCardPressed,
      onTapDown: (_) =>
          setState(() => isPressed = widget.onCardPressed != null),
      onTapCancel: () => setState(() => isPressed = false),
      onTapUp: (_) => setState(() => isPressed = false),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Image.asset(
                      widget.imagePath,
                      height: 150,
                      color: AppColors.turquoise[500],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (widget.body == null)
                    Text(
                      widget.title!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    )
                  else
                    widget.body!,
                  if (widget.subtitle != null)
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        widget.subtitle!,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  if (widget.onButtonPressed != null &&
                      widget.buttonTitle != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: UNHCRJobsButton(
                        onPressed: widget.onButtonPressed!,
                        label: widget.buttonTitle!,
                      ),
                    ),
                ],
              ),
            ),
            if (widget.onCardPressed != null)
              const Positioned.fill(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(CupertinoIcons.chevron_forward),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
