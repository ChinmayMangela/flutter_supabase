import 'package:flutter_supabase/core/failure/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params param);
}

class NoParams {}
