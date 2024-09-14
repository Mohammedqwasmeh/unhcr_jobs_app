part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  HomeSuccess({required this.allJobs});

  final List<Job> allJobs;
}

class HomeRefreshing extends HomeState {
  HomeRefreshing({required this.allJobs});

  final List<Job> allJobs;
}

class HomeError extends HomeState {
  HomeError({required this.errors});

  final Map<String, dynamic> errors;
}

class HomeRefreshError extends HomeState {
  HomeRefreshError({
    required this.errors,
    required this.cashedAllJobs,
  });

  final Map<String, dynamic> errors;
  final List<Job>? cashedAllJobs;
}
