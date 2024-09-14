import 'package:unhcr_jobs_app/core/constant/endpoints.dart';
import 'package:unhcr_jobs_app/core/error/server_failure.dart';
import 'package:unhcr_jobs_app/core/error/success.dart';
import 'package:unhcr_jobs_app/core/network/base.dart';
import 'package:dartz/dartz.dart';

class HomeNetwork {
  static Future<Either<ServerFailure, Success>> getJobs() async {
    final result = await NetworkBase().get(
      api: AppEndpoints.jobs,
    );
    return result.fold((ServerFailure failure) {
      return Left(failure);
    }, (Success success) {
      return Right(success);
    });
  }
}
