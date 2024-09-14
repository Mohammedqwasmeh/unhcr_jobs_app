import 'dart:async';

import 'package:unhcr_jobs_app/core/error/server_failure.dart';
import 'package:unhcr_jobs_app/core/error/success.dart';
import 'package:unhcr_jobs_app/core/util/other/toast_util.dart';
import 'package:unhcr_jobs_app/features/home/model/job.dart';
import 'package:unhcr_jobs_app/features/home/network/home_network.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<GetAllJobs>(_getData);
    on<RefreshAllJobs>(_getData);
  }

  List<Job>? _cachedAllJobs;

  Future<void> _getData(
    HomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    late HomeState state;
    if (event is RefreshAllJobs) {
      state = (_cachedAllJobs == null)
          ? HomeLoading()
          : HomeRefreshing(
              allJobs: _cachedAllJobs!,
            );
    } else {
      _cachedAllJobs = null;
      state = HomeLoading();
    }
    emit(state);
    try {
      final jobs = _getAllJobs();
      state = HomeSuccess(
        allJobs: await jobs,
      );
    } on ServerFailure catch (failure) {
      unawaited(
        ToastUtil.showToast(
          msg: failure.errors.values.first.toString(),
        ),
      );
      final errors = failure.errors;
      state = event is RefreshAllJobs
          ? HomeRefreshError(
              cashedAllJobs: _cachedAllJobs,
              errors: errors,
            )
          : HomeError(errors: errors);
    } on Exception catch (e) {
      unawaited(
        ToastUtil.showToast(
          msg: e.toString(),
        ),
      );
      final errors = {'message': e.toString()};
      state = event is RefreshAllJobs
          ? HomeRefreshError(cashedAllJobs: _cachedAllJobs, errors: errors)
          : HomeError(errors: errors);
      state = HomeError(errors: errors);
    }
    emit(state);
  }

  Future<List<Job>> _getAllJobs() async {
    late List<Job> allJobs;
    final networkResult = await HomeNetwork.getJobs();
    networkResult.fold((ServerFailure failure) {
      throw failure;
    }, (Success success) {
      final data = success.data;
      if (data != null) {
        final listOfJobs = data['data'] as List;
        final responseJobs = listOfJobs
            .map<Job>(
              (json) => Job.fromJson(json as Map<String, dynamic>),
            )
            .toList();
        _cachedAllJobs = responseJobs;
        allJobs = responseJobs;
      } else {
        throw Exception('all jobs data is null');
      }
    });
    return allJobs;
  }
}
