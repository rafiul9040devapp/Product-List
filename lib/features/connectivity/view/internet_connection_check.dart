import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/features/pages.dart';
import '../cubit/connectivity_cubit.dart';
import 'components/no_internet_connection.dart';

class InternetConnectionCheckPage extends StatelessWidget {
  const InternetConnectionCheckPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityCubit, ConnectivityState>(
      builder: (context, connectivityState) {
        return switch(connectivityState){
          ConnectivityState.connected => const ProductPage(),
          ConnectivityState.disconnected => const NoInternetConnection(),
        };
      },
    );
  }
}
