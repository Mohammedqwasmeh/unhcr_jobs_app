import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unhcr_jobs_app/core/widgets/UNHCRJobs_app_bar.dart';
import 'package:unhcr_jobs_app/core/widgets/UNHCRJobs_card.dart';
import 'package:unhcr_jobs_app/core/widgets/shimmer_list.dart';
import 'package:unhcr_jobs_app/features/home/bloc/home_bloc.dart';
import 'package:unhcr_jobs_app/features/home/model/job.dart';
import 'package:unhcr_jobs_app/features/home/widget/job_list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Job> cashedAllJobs = [];
  List<Job> filteredJobs = [];
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: UNHCRJobsAppBar(
          title: 'ALL JOBS',
          onSearchChanged: _onSearchChanged,
        ),
        body: Stack(
          children: [
            BlocProvider(
              create: (context) => HomeBloc()..add(GetAllJobs()),
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: _jobsBody,
              ),
            ),
          ],
        ),
      );

  Widget _jobsBody(BuildContext context, HomeState state) {
    switch (state.runtimeType) {
      case HomeSuccess:
        cashedAllJobs = (state as HomeSuccess).allJobs;
        filteredJobs = filteredJobs.isEmpty ? cashedAllJobs : filteredJobs;
        filteredJobs = _searchQuery.isEmpty
            ? cashedAllJobs
            : cashedAllJobs.where((job) {
                final jobTitleLower = job.title.toLowerCase();
                final searchQueryLower = _searchQuery.toLowerCase();
                return jobTitleLower.contains(searchQueryLower);
              }).toList();
        return cashedAllJobs.isNotEmpty
            ? _allJobsList(context, filteredJobs)
            : _emptyAllJobs(context);
      case HomeError:
        return _errorView(context);
      case HomeRefreshError:
        cashedAllJobs = (state as HomeRefreshError).cashedAllJobs ?? [];
        filteredJobs = filteredJobs.isEmpty ? cashedAllJobs : filteredJobs;
        filteredJobs = _searchQuery.isEmpty
            ? cashedAllJobs
            : cashedAllJobs.where((job) {
                final jobTitleLower = job.title.toLowerCase();
                final searchQueryLower = _searchQuery.toLowerCase();
                return jobTitleLower.contains(searchQueryLower);
              }).toList();
        return cashedAllJobs.isNotEmpty
            ? _allJobsList(context, filteredJobs)
            : _emptyAllJobs(context);
      default:
        return const ShimmerList();
    }
  }

  ListView _errorView(BuildContext context) => ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          UNHCRJobsCard(
            imagePath: 'assets/images/error.png',
            title: 'Something went wrong!',
            onButtonPressed: () => _getAllJobs(context),
            buttonTitle: 'Try Again',
          ),
        ],
      );

  RefreshIndicator _allJobsList(BuildContext context, List<Job> jobs) {
    return RefreshIndicator(
      onRefresh: () => _refreshAllJobs(context),
      child: ListView(
        padding: const EdgeInsets.only(
          bottom: 16,
        ),
        children: [
          ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: jobs.length,
            itemBuilder: (context, index) => JobListItem(
              job: jobs[index],
            ),
          ),
        ],
      ),
    );
  }

  RefreshIndicator _emptyAllJobs(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => _refreshAllJobs(context),
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        physics: const AlwaysScrollableScrollPhysics(),
        children: const [
          UNHCRJobsCard(
            imagePath: 'assets/images/empty.png',
            title: 'There is no jobs!',
            subtitle: 'Pull to refresh',
          ),
        ],
      ),
    );
  }

  Future<void> _getAllJobs(BuildContext context) async =>
      BlocProvider.of<HomeBloc>(context).add(GetAllJobs());

  Future<void> _refreshAllJobs(BuildContext context) async {
    final profileBloc = BlocProvider.of<HomeBloc>(context)
      ..add(RefreshAllJobs());
    await for (final result in profileBloc.stream) {
      if (result is HomeSuccess || result is HomeError) return;
    }
  }

  void _onSearchChanged(String query) {
    _searchQuery = query;
    setState(() {
      filteredJobs = _searchQuery.isEmpty
          ? cashedAllJobs
          : cashedAllJobs.where((job) {
              final jobTitleLower = job.title.toLowerCase();
              final searchQueryLower = _searchQuery.toLowerCase();
              return jobTitleLower.contains(searchQueryLower);
            }).toList();
    });
  }
}
