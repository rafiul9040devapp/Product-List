import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/features/pages.dart';
import 'package:product_list/routes/navigation_helper.dart';
import 'package:product_list/routes/routes_name.dart';
import '../../../core/utils/dialogue_helper.dart';
import '../../../themes/app_colors.dart';
import '../bloc/navigation_bloc.dart';

class HomePage extends StatefulWidget {
  final int initialPage;
  const HomePage({super.key, required this.initialPage});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialPage);

    // Initialize AnimationController
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _onBottomNavTapped(int index) {
    context.read<NavigationBloc>().add(PageTapped(index));
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500), // corrected duration
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop,Object? result){
        DialogHelper.showExitConfirmationDialog(context);
      },
      child: Scaffold(
        body: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
            _animationController.forward(from: 1);
            return SlideTransition(
              position: _slideAnimation,
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  context.read<NavigationBloc>().add(PageTapped(index));

                  // Updated navigation logic
                  final routeName = switch (index) {
                    0 => RoutesName.home,
                    1 => RoutesName.createProduct,
                    _ => throw UnimplementedError(),
                  };

                  // Navigate based on the route name
                  context.replaceWith(routeName: routeName);
                },
                children: const [
                  ProductPage(),
                  CreateOrUpdateProductPage(),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
            return BottomNavigationBar(
              currentIndex: state.selectedIndex,
              selectedItemColor: AppColors.black,
              unselectedItemColor: AppColors.grey,
              onTap: _onBottomNavTapped,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.create_new_folder_rounded),
                  label: 'Create',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
