import 'package:flutter/material.dart';
import 'package:unhcr_jobs_app/core/constant/colors.dart';

class UNHCRJobsButton extends StatefulWidget {
  const UNHCRJobsButton({
    required this.onPressed,
    required this.label,
    super.key,
    this.isLoading = false,
  });

  final VoidCallback onPressed;
  final String label;
  final bool isLoading;

  @override
  State<UNHCRJobsButton> createState() => UNHCRJobsButtonState();
}

class UNHCRJobsButtonState extends State<UNHCRJobsButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.isLoading ? () {} : widget.onPressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11),
        ),
        minimumSize: const Size.fromHeight(40),
        padding: const EdgeInsets.all(12),
        elevation: 0,
        backgroundColor: AppColors.grey[500],
      ),
      child: widget.isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 3,
              ),
            )
          : Text(
              widget.label,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 13,
                color: Colors.white,
              ),
            ),
    );
  }
}
