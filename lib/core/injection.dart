import 'package:get_it/get_it.dart';
import 'package:neuro_wood/app/data/repositories/auth_repository.dart';
// import 'package:neuro_wood/app/data/repositories/measure_result_report_repository.dart';
import 'package:neuro_wood/app/data/repositories/measurements_repository.dart';
import 'package:neuro_wood/app/data/repositories/nw_repository.dart';
import 'package:neuro_wood/app/data/repositories/parameters_measure_repository.dart';
import 'package:neuro_wood/app/data/repositories/reauth_repository.dart';
import 'package:neuro_wood/app/data/repositories/register_repository.dart';
import 'package:neuro_wood/app/data/repositories/subscriptions_repository.dart';
import 'package:neuro_wood/app/data/repositories/user_additional_repository.dart';
import 'package:neuro_wood/app/data/repositories/user_repository.dart';
// import 'package:neuro_wood/app/domain/entities/measure_request_builder.dart';
import 'package:neuro_wood/app/domain/entities/user_entity.dart';
import 'package:neuro_wood/app/domain/repositories/i_auth_repository.dart';
// import 'package:neuro_wood/app/domain/repositories/i_measure_result_report_repository.dart';
import 'package:neuro_wood/app/domain/repositories/i_measurements_repository.dart';
import 'package:neuro_wood/app/domain/repositories/i_nw_repository.dart';
import 'package:neuro_wood/app/domain/repositories/i_parameters_measure_repository.dart';
import 'package:neuro_wood/app/domain/repositories/i_reauth_repository.dart';
import 'package:neuro_wood/app/domain/repositories/i_register_repository.dart';
import 'package:neuro_wood/app/domain/repositories/i_subscriptions_repository.dart';
import 'package:neuro_wood/app/domain/repositories/i_user_additional_repository.dart';
import 'package:neuro_wood/app/domain/repositories/i_user_repository.dart';
import 'package:neuro_wood/app/ui/screens/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:neuro_wood/app/ui/screens/auth/bloc/reauth_bloc/reauth_bloc.dart';
import 'package:neuro_wood/app/ui/screens/camera/bloc/camera_bloc.dart';
import 'package:neuro_wood/app/ui/screens/main/cubit/cubit/measure_limit_cubit.dart';
import 'package:neuro_wood/app/ui/screens/main/cubit/permission_cubit/main_screen_cubit.dart';
import 'package:neuro_wood/app/ui/screens/measure_result/cubit/image_loader/image_loader_cubit.dart';
import 'package:neuro_wood/app/ui/screens/measure_result/cubit/report_builder/report_builder_cubit.dart';
import 'package:neuro_wood/app/ui/screens/measure_result/cubit/report_saver/report_saver_cubit.dart';
import 'package:neuro_wood/app/ui/screens/measurements/cubit/measurements_cubit.dart';
import 'package:neuro_wood/app/ui/screens/profile/bloc/cubit/profile_delete_cubit.dart';
import 'package:neuro_wood/app/ui/screens/profile/bloc/profile_cubit/profile_cubit.dart';
import 'package:neuro_wood/app/ui/screens/profile/bloc/profile_editor/profile_editor_bloc.dart';
import 'package:neuro_wood/app/ui/screens/register/bloc/checkbox_cubit/checkbox_cubit.dart';
import 'package:neuro_wood/app/ui/screens/register/bloc/register_bloc/register_bloc.dart';
import 'package:neuro_wood/app/ui/screens/subscriptions/cubit/subscribtions_cubit.dart';
import 'package:neuro_wood/core/services/analytics/app_metrica_service.dart';
import 'package:neuro_wood/core/services/analytics/i_analytics.dart';
import 'package:neuro_wood/core/services/firebase/firebase_auth/firebase_auth_service.dart';
import 'package:neuro_wood/core/services/firebase/firebase_cloud_service.dart';
import 'package:neuro_wood/core/services/firebase/firebase_crashlytics_service.dart';
import 'package:neuro_wood/core/services/firebase/firebase_data_source.dart';
import 'package:neuro_wood/core/services/firebase/firebase_firestore_service.dart';
import 'package:neuro_wood/core/services/firebase/firebase_storage_service.dart';
import 'package:neuro_wood/core/services/network/network_service.dart';
import 'package:neuro_wood/core/services/pdf_builder/pdf_builder.dart';
import 'package:neuro_wood/core/services/permissions/permissions.dart';

// import '../app/ui/screens/parameters_measure/bloc/parameters_measure_bloc.dart';
import 'services/sensors/sensor.dart';

final getIt = GetIt.instance;
Future<void> init() async {
  //services
  getIt.registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());
  getIt.registerLazySingleton<FirebaseFirestoreService>(
      () => FirebaseFirestoreService());
  getIt.registerLazySingleton<FirebaseStorageService>(
      () => FirebaseStorageService());
  getIt.registerLazySingleton<FirebaseCloudService>(
      () => FirebaseCloudService());
  getIt.registerLazySingleton<FirebaseCrashlyticsService>(
      () => FirebaseCrashlyticsService());

  getIt.registerLazySingleton<FirebaseDataSource>(() => FirebaseDataSource(
        firebaseAuthService: getIt.get<FirebaseAuthService>(),
        firebaseFirestoreService: getIt.get<FirebaseFirestoreService>(),
        firebaseStorageService: getIt.get<FirebaseStorageService>(),
        firebaseCloudService: getIt.get<FirebaseCloudService>(),
        firebaseCrashlyticsService: getIt.get<FirebaseCrashlyticsService>(),
      ));
  getIt.registerFactory<NetworkService>(() => NetworkService());
  getIt.registerFactory<PDFBuilder>(() => PDFBuilder());

  getIt.registerLazySingleton<Permissions>(() => Permissions());
  getIt.registerFactory<InclineSensor>(() => InclineSensor());
  //repositories
  getIt.registerLazySingleton<IAuthRepository>(() => AuthRepository(
        firebaseDataSource: getIt.get<FirebaseDataSource>(),
      ));
  getIt.registerLazySingleton<IRegisterRepository>(() => RegisterRepository(
        firebaseDataSource: getIt.get<FirebaseDataSource>(),
      ));
  getIt.registerLazySingleton<IParametersMeasureRepository>(
      () => ParametersMeasureRepository(
            firebaseDataSource: getIt.get<FirebaseDataSource>(),
          ));
  getIt.registerLazySingleton<IUserRepository>(() => UserRepository(
        firebaseDataSource: getIt.get<FirebaseDataSource>(),
      ));
  getIt.registerLazySingleton<INWRepository>(() => NWRepository(
        networkService: getIt.get<NetworkService>(),
        firebaseDataSource: getIt.get<FirebaseDataSource>(),
      ));
  getIt.registerLazySingleton<IUserAdditionalRepository>(
      () => UserAdditionalRepository(
            firebaseDataSource: getIt.get<FirebaseDataSource>(),
          ));
  getIt.registerLazySingleton<IMeasurementsRepository>(
      () => MeasurementsRepository(
            firebaseDataSource: getIt.get<FirebaseDataSource>(),
          ));
  getIt.registerLazySingleton<ISubscriptionsRepository>(
      () => SubscriptionsRepository(
            firebaseDataSource: getIt.get<FirebaseDataSource>(),
          ));
  getIt.registerLazySingleton<IReauthRepository>(() => ReauthRepository(
        firebaseDataSource: getIt.get<FirebaseDataSource>(),
      ));

  getIt.registerLazySingleton<IAnalytics>(() => AppMetricaService());
  // getIt.registerLazySingleton<IMeasureResultReportReportRepository>(() => MeasureResultReportReportRepository(
  //       firebaseDataSource: getIt.get<FirebaseDataSource>(),
  //     ));

  //blocs
  getIt.registerLazySingleton<MeasureLimitCubit>(() => MeasureLimitCubit(
        getIt.get<IUserRepository>(),
      ));

  getIt.registerFactory<AuthBloc>(() => AuthBloc(
        authRepository: getIt.get<IAuthRepository>(),
        analytics: getIt.get<IAnalytics>(),
      ));
  getIt.registerFactory<RegisterBloc>(() => RegisterBloc(
        registerRepository: getIt.get<IRegisterRepository>(),
      ));
  // getIt.registerFactory<ParametersMeasureBloc>(() => ParametersMeasureBloc(
  //       parametersMeasureRepository: getIt.get<IParametersMeasureRepository>(),
  //     ));
  getIt.registerFactory<MainScreenCubit>(() => MainScreenCubit(
        measureLimitCubit: getIt.get<MeasureLimitCubit>(),
        permissions: getIt.get<Permissions>(),
        userRepository: getIt.get<IUserAdditionalRepository>(),
      ));
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(
        userRepository: getIt.get<IUserRepository>(),
      ));
  getIt.registerFactory<MeasurementsCubit>(() => MeasurementsCubit(
        measurementsRepository: getIt.get<IMeasurementsRepository>(),
      ));
  getIt.registerFactory<ImageLoaderCubit>(() => ImageLoaderCubit(
        measurementsRepository: getIt.get<IMeasurementsRepository>(),
      ));
  getIt.registerFactory<SubscribtionsCubit>(() => SubscribtionsCubit(
        subscriptionsRepository: getIt.get<ISubscriptionsRepository>(),
      ));
  getIt.registerFactory<ReportBuilderCubit>(() => ReportBuilderCubit(
        pdfBuilder: getIt.get<PDFBuilder>(),
      ));
  getIt.registerFactory<ReportSaverCubit>(() => ReportSaverCubit(
        permissions: getIt.get<Permissions>(),
      ));
  getIt.registerFactory<ProfileDeleteCubit>(() => ProfileDeleteCubit(
        userRepository: getIt.get<IUserRepository>(),
      ));
  getIt.registerFactory<ReauthBloc>(() => ReauthBloc(
        reauthRepository: getIt.get<IReauthRepository>(),
      ));
  getIt.registerFactoryParam<ToggleCubit, bool, dynamic>(
    ([bool value = false, dynamic p2]) => ToggleCubit(value: value),
  );
  getIt.registerFactoryParam<ProfileEditorBloc, UserEntity, dynamic>(
    (UserEntity user, dynamic p2) => ProfileEditorBloc(
      userRepository: getIt.get<IUserRepository>(),
      user: user,
    ),
  );
  getIt.registerFactory<CameraBloc>(() => CameraBloc(
        nwRepository: getIt.get<INWRepository>(),
        sensor: getIt.get<InclineSensor>(),
        // measureRequestBuilder: builder,
        permissions: getIt.get<Permissions>(),
      ));
}
