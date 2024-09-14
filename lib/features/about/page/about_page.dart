import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:unhcr_jobs_app/core/widgets/UNHCRJobs_app_bar.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const UNHCRJobsAppBar(
          title: 'About Me',
        ),
        body: SfPdfViewer.asset('assets/files/resume.pdf'),
      );
}
