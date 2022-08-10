import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies/features/add_order/presentation/bloc/cubit/place_order_cubit.dart';
import 'features/home/presentation/bloc/user_bloc/user_cubit.dart';
import 'features/login/presentation/login_cubit/login_cubit.dart';
import 'features/signup/presentation/auth_bloc/auth_cubit.dart';
import 'injection_container.dart' as di;
import 'routes.dart';
import 'theme.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => di.sl<AuthCubit>()..AppStarted(),
        ),
        BlocProvider<LoginCubit>(
          create: (_) => di.sl<LoginCubit>(),
        ),
        BlocProvider<UserCubit>(
          create: (_) => di.sl<UserCubit>(),
        ),
        BlocProvider<PlaceOrderCubit>(
          create: (_) => di.sl<PlaceOrderCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Foodies',
        theme: theme(),
        routes: routes,
      ),
    );
  }
}
