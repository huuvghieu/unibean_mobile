import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:unibean_app/data/repositories.dart';
import 'package:unibean_app/domain/repositories.dart';
import 'package:unibean_app/firebase_options.dart';
import 'package:unibean_app/presentation/config/app_router.dart';
import 'package:unibean_app/presentation/cubits/verification/verification_cubit.dart';
import 'package:unibean_app/simple_bloc_observer.dart';

import 'presentation/blocs/blocs.dart';
import 'presentation/cubits/validation/validation_cubit.dart';
import 'presentation/screens/screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Future.delayed(const Duration(seconds: 2));
  //init Hive
  await Hive.initFlutter();

  //open the box
  // ignore: unused_local_variable
  await Hive.openBox('myBox');
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationRepository>(
            create: (_) => AuthenticationRepositoryImp()),
        RepositoryProvider<ValidationRepository>(
            create: (_) => ValidationRepositoryImp()),
        RepositoryProvider<VerificationRepository>(
            create: (_) => VerificationRepositoryImp()),
        RepositoryProvider<UniversityRepository>(
            create: (_) => UniversityRepositoryImp()),
        RepositoryProvider<CampusRepository>(
            create: (_) => CampusRepositoryImp()),
        RepositoryProvider<MajorRepository>(
            create: (_) => MajorRepositoryImp()),
        RepositoryProvider<StudentRepository>(
            create: (_) => StudentRepositoryImp()),
        RepositoryProvider<StoreRepository>(
            create: (_) => StoreRepositoryImp()),
        RepositoryProvider<CampaignRepository>(
            create: (_) => CampaignRepositoryImp()),
        RepositoryProvider<BrandRepository>(
            create: (_) => BrandRepositoryImp()),
        RepositoryProvider<VoucherRepository>(
            create: (_) => VoucherRepositoryImp()),
        RepositoryProvider<ChallengeRepository>(
            create: (_) => ChallengeRepositoryImp()),
        RepositoryProvider<ProductRepository>(
            create: (_) => ProductRepositoryImp()),
        RepositoryProvider<StationRepository>(
            create: (_) => StationRepositoryImp()),
        RepositoryProvider<WishListRepository>(
            create: (_) => WishListRepositoryImp()),
        RepositoryProvider<AreaRepository>(create: (_) => AreaRepositoryImp())
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LandingScreenBloc()),
          BlocProvider(
              create: (context) =>
                  RoleAppBloc(StudentRepositoryImp(), StoreRepositoryImp())
                    ..add(RoleAppStart())),
          BlocProvider(
            create: (context) => AuthenticationBloc(
                authenticationRepository: AuthenticationRepositoryImp())
              ..add(StartAuthen()),
          ),
          BlocProvider(
              create: (context) => ValidationCubit(ValidationRepositoryImp())
                ..loadingValidation()),
          BlocProvider(
              create: (context) =>
                  VerificationCubit(VerificationRepositoryImp())
                    ..loadingVerification()),
          BlocProvider(
              create: (context) => UniversityBloc(
                  universityRepository: UniversityRepositoryImp())
                ..add(LoadUniversities())),
          BlocProvider(
            create: (context) => CampusBloc(CampusRepositoryImp()),
          ),
          BlocProvider(
            create: (context) =>
                AreaBloc(areaRepository: AreaRepositoryImp())..add(LoadAreas()),
          ),
          BlocProvider(
            create: (context) =>
                MajorBloc(majorRepository: MajorRepositoryImp())
                  ..add(LoadMajor()),
          ),
          BlocProvider(
              create: (context) =>
                  StoreBloc(storeRepository: StoreRepositoryImp())
                    ..add(LoadStoreCampaignVouchers())),
          BlocProvider(
            create: (context) =>
                RankingBloc(storeRepository: StoreRepositoryImp())
                  ..add(LoadCampaignRanking()),
          ),
          BlocProvider(
            create: (context) =>
                CampaignBloc(campaignRepository: CampaignRepositoryImp())
                  ..add(LoadCampaigns()),
          ),
          BlocProvider(
              create: (context) => WishlistBloc(
                  studentRepository: StudentRepositoryImp(),
                  wishListRepository: WishListRepositoryImp())
                ..add(LoadWishListByStudentId())),
          BlocProvider(
            create: (context) =>
                BrandBloc(brandRepository: BrandRepositoryImp())
                  ..add(LoadBrands(limit: 5)),
          ),
          BlocProvider(
            create: (context) =>
                VoucherBloc(voucherRepository: VoucherRepositoryImp())
                  ..add(LoadVouchers()),
          ),
          BlocProvider(
            create: (context) => ChallengeBloc(
                challengeRepository: ChallengeRepositoryImp(),
                studentRepository: StudentRepositoryImp())
              ..add(LoadChallenge()),
          ),
          BlocProvider(
            create: (context) => CartBloc()..add(LoadCart()),
          ),
          BlocProvider(
            create: (context) =>
                ProductBloc(productRepository: ProductRepositoryImp())
                  ..add(LoadProducts()),
          ),
          BlocProvider(
            create: (context) => CartBloc()..add(LoadCart()),
          ),
          BlocProvider(
            create: (context) =>
                StationBloc(stationRepository: StationRepositoryImp())
                  ..add(LoadStations(limit: 100)),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Unibean',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            useMaterial3: true,
          ),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: SplashScreen.routeName,
        ),
      ),
    );
  }
}
