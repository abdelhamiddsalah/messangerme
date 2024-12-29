import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:messangerme/controllers/auth_cubit/auth_cubit.dart';
import 'package:messangerme/core/repositries/repositry.dart';

final sl = GetIt.instance;

void initDependencies() {
  // FirebaseAuth Instance
  sl.registerLazySingleton(() => FirebaseAuth.instance);

  // Repository
  sl.registerLazySingleton(() => Repositry(sl()));

  // Cubit
  sl.registerFactory(() => AuthCubit(sl()));
}
