import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_list/features/bottom_nav/bloc/navigation_bloc.dart';
import 'package:product_list/features/bottom_nav/cubit/bottom_nav_cubit.dart';
import 'package:product_list/features/connectivity/view/internet_connection_check.dart';
import 'package:product_list/features/products/bloc/product_bloc.dart';
import 'package:product_list/routes/routes.dart';
import 'package:product_list/themes/light_mode.dart';
import 'di/injection_container.dart';
import 'features/connectivity/cubit/connectivity_cubit.dart';


class ProductApp extends StatelessWidget {
  const ProductApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<ConnectivityCubit>(create: (context) => sl<ConnectivityCubit>()),
            BlocProvider<BottomNavCubit>(create: (context) => sl<BottomNavCubit>()),
            BlocProvider<NavigationBloc>(create: (context) => sl<NavigationBloc>()),
            BlocProvider<ProductBloc>(create: (context) => sl<ProductBloc>()..add(FetchAllProductEvent())),
          ],
          child: MaterialApp(
            title: 'CRUD',
            debugShowCheckedModeBanner: false,
            theme: lightMode,
            onGenerateRoute: RouteGenerator.generateRoute,
            home: const InternetConnectionCheckPage(),
          ),
        );
      },
    );
  }
}
