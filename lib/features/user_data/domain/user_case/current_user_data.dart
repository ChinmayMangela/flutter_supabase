

import 'package:flutter_supabase/core/failure/failure.dart';
import 'package:flutter_supabase/core/use_case/use_case.dart';
import 'package:flutter_supabase/features/auth/domain/entity/end_user.dart';
import 'package:flutter_supabase/features/user_data/domain/repository/end_user_repository.dart';
import 'package:fpdart/fpdart.dart';

class CurrentUserData implements UseCase<EndUser, NoParams>{
  final EndUserRepository endUserRepository;

  const CurrentUserData(this.endUserRepository);

  @override
  Future<Either<Failure, EndUser>> call(NoParams param) async {
    return await endUserRepository.getUserData();
  }


}