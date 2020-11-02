import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/bloc/home_tab_bloc.dart';
import 'presentation/home_tab_page.dart';
import 'presentation/home_tab_router.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeTabBloc(),
      child: HomeTabRouter(
        child: HomeTabPage(),
      ),
    );
  }
}
