import 'package:architecture_template/features/details_page/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/home_bloc.dart';

enum HomeRouterAction { close, showDetailScreen }

class HomeRouter extends StatelessWidget {
  final Widget child;

  const HomeRouter({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeStateSuccess &&
            state.routerAction == HomeRouterAction.showDetailScreen) {
          var page = DetailsPage();
          Navigator.of(context).push(MaterialPageRoute(builder: (builder) {
            return page;
          }));
        }
      },
      child: child,
    );
  }
}
