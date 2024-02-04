import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:unibean_app/data/repositories.dart';
import 'package:unibean_app/domain/repositories.dart';
import 'package:unibean_app/firebase_options.dart';
import 'package:unibean_app/presentation/config/app_router.dart';
import 'package:unibean_app/presentation/cubits/validation/validation_cubit.dart';
import 'package:unibean_app/simple_bloc_observer.dart';

import 'presentation/blocs/blocs.dart';
import 'presentation/screens/screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
        RepositoryProvider<UniversityRepository>(
            create: (_) => UniversityRepositoryImp()),
        RepositoryProvider<CampusRepository>(
            create: (_) => CampusRepositoryImp()),
        RepositoryProvider<MajorRepository>(
            create: (_) => MajorRepositoryImp()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LandingScreenBloc()),
          BlocProvider(create: (context) => RoleAppBloc()..add(RoleAppStart())),
          BlocProvider(
            create: (context) => AuthenticationBloc(
                authenticationRepository: AuthenticationRepositoryImp())
              ..add(StartAuthen()),
          ),
          BlocProvider(
              create: (context) => ValidationCubit(ValidationRepositoryImp())
                ..loadingValidation()),
          BlocProvider(
              create: (context) => UniversityBloc(
                  universityRepository: UniversityRepositoryImp())
                ..add(LoadUniversity())),
          BlocProvider(
            create: (context) => CampusBloc(CampusRepositoryImp()),
          ),
          BlocProvider(
            create: (context) =>
                MajorBloc(majorRepository: MajorRepositoryImp())
                  ..add(LoadMajor()),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: SplashScreen.routeName,
        ),
      ),
    );
  }
}
