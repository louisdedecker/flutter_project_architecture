import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/authentication_bloc.dart';

enum AuthenticationRouterAction { close, nextScreen }

class AuthenticationRouter extends StatelessWidget {
  final Widget child;

  const AuthenticationRouter({Key key, @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationSuccess &&
            state.routerAction == AuthenticationRouterAction.nextScreen) {
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
