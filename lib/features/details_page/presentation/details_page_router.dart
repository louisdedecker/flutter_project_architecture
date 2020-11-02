import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/details_page_bloc.dart';

enum DetailsPageRouterAction { close, nextScreen }

class DetailsPageRouter extends StatelessWidget {
  final Widget child;

  const DetailsPageRouter({Key key, @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<DetailsPageBloc, DetailsPageState>(
      listener: (context, state) {
        if (state is DetailsPageStateSuccess &&
            state.routerAction == DetailsPageRouterAction.nextScreen) {
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
