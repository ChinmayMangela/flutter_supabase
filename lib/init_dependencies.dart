import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_supabase/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:flutter_supabase/features/auth/data/repository/auth_repository_impl.dart';
import 'package:flutter_supabase/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_supabase/features/auth/domain/use_case/current_user.dart';
import 'package:flutter_supabase/features/auth/domain/use_case/reset_password.dart';
import 'package:flutter_supabase/features/auth/domain/use_case/sign_in.dart';
import 'package:flutter_supabase/features/auth/domain/use_case/sign_out.dart';
import 'package:flutter_supabase/features/auth/domain/use_case/sign_up.dart';
import 'package:flutter_supabase/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_supabase/features/ingredient_scanner/data/remote/ingredient_scanner_remote_data_source.dart';
import 'package:flutter_supabase/features/ingredient_scanner/data/repository/ingredient_scanner_repository_impl.dart';
import 'package:flutter_supabase/features/ingredient_scanner/domain/repository/ingredient_scanner_repository.dart';
import 'package:flutter_supabase/features/ingredient_scanner/domain/use_case/scan_ingredients.dart';
import 'package:flutter_supabase/features/ingredient_scanner/presentation/bloc/ingredient_scanner_bloc.dart';
import 'package:flutter_supabase/features/user_data/data/remote/end_user_remote_data_source.dart';
import 'package:flutter_supabase/features/user_data/data/repository/end_user_repository_impl.dart';
import 'package:flutter_supabase/features/user_data/domain/repository/end_user_repository.dart';
import 'package:flutter_supabase/features/user_data/domain/user_case/current_user_data.dart';
import 'package:flutter_supabase/features/user_data/domain/user_case/get_scanned_history.dart';
import 'package:flutter_supabase/features/user_data/domain/user_case/save_scanned_data.dart';
import 'package:flutter_supabase/features/user_data/domain/user_case/save_user.dart';
import 'package:flutter_supabase/features/user_data/presentation/bloc/user_data_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  serviceLocator.registerLazySingleton<SupabaseClient>(
    () => Supabase.instance.client,
  );
  await _initAuth();

  serviceLocator.registerLazySingleton<EndUserRemoteDataSource>(
    () => EndUserRemoteDataSourceImpl(client: serviceLocator()),
  );

  serviceLocator.registerLazySingleton<EndUserRepository>(
    () => EndUserRepositoryImpl(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => CurrentUserData(serviceLocator<EndUserRepository>()),
  );
  serviceLocator.registerLazySingleton(
    () => GetScannedHistory(serviceLocator<EndUserRepository>()),
  );
  serviceLocator.registerLazySingleton(
    () => SaveScannedData(serviceLocator<EndUserRepository>()),
  );
  serviceLocator.registerLazySingleton(
    () => SaveUser(serviceLocator<EndUserRepository>()),
  );

  serviceLocator.registerFactory(
    () => UserDataBloc(
      saveUser: serviceLocator<SaveUser>(),
      currentUserData: serviceLocator<CurrentUserData>(),
      getScannedHistory: serviceLocator<GetScannedHistory>(),
      saveScannedData: serviceLocator<SaveScannedData>(),
    ),
  );

  final String geminiApiKey = dotenv.env['GEMINI_API_KEY'] ?? '';
  serviceLocator.registerLazySingleton<GenerativeModel>(
    () => GenerativeModel(model: 'gemini-flash-latest', apiKey: geminiApiKey),
  );

  serviceLocator.registerLazySingleton<IngredientScannerRemoteDataSource>(
    () => IngredientScannerRemoteDataSourceImpl(
      serviceLocator<GenerativeModel>(),
    ),
  );

  serviceLocator.registerLazySingleton<IngredientScannerRepository>(
    () => IngredientScannerRepositoryImpl(
      serviceLocator<IngredientScannerRemoteDataSource>(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => ScanIngredients(serviceLocator<IngredientScannerRepository>()),
  );

  serviceLocator.registerFactory(
    () => IngredientScannerBloc(
      scanIngredients: serviceLocator<ScanIngredients>(),
    ),
  );
}

Future<void> _initAuth() async {
  serviceLocator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(serviceLocator<SupabaseClient>()),
  );

  serviceLocator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(serviceLocator<AuthRemoteDataSource>()),
  );

  serviceLocator.registerLazySingleton(
    () => SignUp(serviceLocator<AuthRepository>()),
  );

  serviceLocator.registerLazySingleton(
    () => SignIn(serviceLocator<AuthRepository>()),
  );

  serviceLocator.registerLazySingleton(
    () => SignOut(serviceLocator<AuthRepository>()),
  );

  serviceLocator.registerLazySingleton(
    () => ResetPassword(serviceLocator<AuthRepository>()),
  );

  serviceLocator.registerLazySingleton(
    () => CurrentUser(serviceLocator<AuthRepository>()),
  );

  serviceLocator.registerFactory(
    () => AuthBloc(
      signIn: serviceLocator<SignIn>(),
      signUp: serviceLocator<SignUp>(),
      signOut: serviceLocator<SignOut>(),
      currentUser: serviceLocator<CurrentUser>(),
      resetPassword: serviceLocator<ResetPassword>(),
    ),
  );
}
