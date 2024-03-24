import 'package:book_store/features/auth_screen/view/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/data/local/shared_helper.dart';
import 'core/data/local/shared_keys.dart';
import 'core/data/network/helper/bloc_observer.dart';
import 'core/data/network/helper/dio_helper.dart';
import 'features/auth_screen/view_model/auth_cubit/cubit.dart';
import 'features/auth_screen/view_model/auth_cubit/state.dart';
import 'features/home_screen/view/screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await SharedHelper.init();
  DioHelper.init();
  //await SharedHelper.clear();
  String? token = await SharedHelper.get(key: SharedKey.token);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
        ),
      ],
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: token == null ? const LoginScreen() : const HomeScreen(),
          );
        },
      ),
    ),
  );
}
