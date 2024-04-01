import 'package:book_store/features/auth_screen/view_model/auth_cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/data/local/shared_helper.dart';
import 'core/data/local/shared_keys.dart';
import 'core/data/network/helper/bloc_observer.dart';
import 'core/data/network/helper/dio_helper.dart';
import 'features/auth_screen/view_model/auth_cubit/state.dart';
import 'features/home_screen/view/screen/splash_screen/splash_screen.dart';
import 'features/home_screen/view_model/cubit/best_seller_cubit/best_seller_cubit.dart';
import 'features/home_screen/view_model/cubit/categories_cubit/categories_cubit.dart';
import 'features/home_screen/view_model/cubit/new_arrival_cubit/slider_cubit.dart';
import 'features/home_screen/view_model/cubit/slider_cubit/slider_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await SharedHelper.init();
  await DioHelper.init();
  //await SharedHelper.clear();
  String? token = await SharedHelper.get(key: SharedKey.token);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
        ),
        BlocProvider<SlidersCubit>(
          create: (context) => SlidersCubit(),
        ),
        BlocProvider<BestSellerCubit>(
          create: (context) => BestSellerCubit(),
        ),
        BlocProvider<CategoriesCubit>(
          create: (context) => CategoriesCubit(),
        ),
        BlocProvider<NewArrivalCubit>(
          create: (context) => NewArrivalCubit(),
        ),
      ],
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          var cubit = BestSellerCubit.get(context);
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: child,
              );
            },
            child: const SplashScreen(),
            //token != null ? HomeScreen() : LoginScreen(),
          );
        },
      ),
    ),
  );
}
