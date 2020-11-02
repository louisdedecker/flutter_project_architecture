import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/home_tab_bloc.dart';

enum HomeTabRouterAction { close, nextScreen }

class HomeTabRouter extends StatelessWidget {
  final Widget child;

  const HomeTabRouter({Key key, @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeTabBloc, HomeTabState>(
      listener: (context, state) {
        if (state is HomeTabStateSuccess &&
            state.routerAction == HomeTabRouterAction.nextScreen) {
          /*
          var page = SomeFeature();
          Navigator.of(context).push(MaterialPageRoute(builder: (builder) {
            return page;
          }));
           */
        }
      },
      child: child,
    );
  }
}
