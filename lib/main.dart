import 'package:book_store/features/auth_screen/view_model/auth_cubit/cubit.dart';
import 'package:book_store/features/books_screen/view_model/cubit/books_cubit.dart';
import 'package:book_store/features/favourite_screen/view_model/cubits/fav_cubit/cubit.dart';
import 'package:book_store/features/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/data/local/shared_helper.dart';
import 'core/data/network/helper/bloc_observer.dart';
import 'core/data/network/helper/dio_helper.dart';
import 'features/auth_screen/view_model/auth_cubit/state.dart';
import 'features/cart_screen/view_model/cubits/cart_cubit/cubit.dart';
import 'features/home_screen/view_model/cubit/best_seller_cubit/best_seller_cubit.dart';
import 'features/home_screen/view_model/cubit/categories_cubit/categories_cubit.dart';
import 'features/home_screen/view_model/cubit/new_arrival_cubit/slider_cubit.dart';
import 'features/home_screen/view_model/cubit/slider_cubit/slider_cubit.dart';
import 'features/order_screen/view_model/cubit/order_cubit/order_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await SharedHelper.init();
  await DioHelper.init();
  //await SharedHelper.clear();
  //String? token = await SharedHelper.get(key: SharedKey.token);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => SlidersCubit()..getSliders()),
        BlocProvider(create: (context) => BestSellerCubit()..getBestSeller()),
        BlocProvider(create: (context) => CategoriesCubit()..getCategories()),
        BlocProvider(create: (context) => NewArrivalCubit()..getNewArrival()),
        BlocProvider(create: (context) => BooksCubit()..getBooks()),
        BlocProvider(create: (context) => FavouriteCubit()),
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(create: (context) => OrderCubit()),
        BlocProvider(create: (context) => OrderCubit()..orderHistory()),
        BlocProvider(create: (context) => OrderCubit()..getGovernoratesList()),
      ],
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
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
          );
        },
      ),
    ),
  );
}
//clip PATH
