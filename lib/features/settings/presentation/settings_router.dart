import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/settings_bloc.dart';

enum SettingsRouterAction { close }

class SettingsRouter extends StatelessWidget {
  final Widget child;

  const SettingsRouter({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsBloc, SettingsState>(
      listener: (context, state) {
        /*
        if (state is SettingsStateSuccess &&
            state.routerAction == SettingsRouterAction.nextScreen) {

          var page = SomeFeature();
          Navigator.of(context).push(MaterialPageRoute(builder: (builder) {
            return page;
          }));

        } */
      },
      child: child,
    );
  }
}
