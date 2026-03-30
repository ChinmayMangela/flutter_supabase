


import 'package:flutter_supabase/core/failure/failure.dart';
import 'package:flutter_supabase/core/use_case/use_case.dart';
import 'package:flutter_supabase/features/auth/domain/entity/end_user.dart';
import 'package:flutter_supabase/features/user_data/domain/repository/end_user_repository.dart';
import 'package:fpdart/fpdart.dart';

class SaveUser implements UseCase<void, SaveUserParams>{
  final EndUserRepository endUserRepository;

  const SaveUser(this.endUserRepository);

  @override
  Future<Either<Failure, void>> call(SaveUserParams param) async {
    return await endUserRepository.saveUser(user: param.user);
  }

}

class SaveUserParams {
  final EndUser user;

  const SaveUserParams({required this.user});
}