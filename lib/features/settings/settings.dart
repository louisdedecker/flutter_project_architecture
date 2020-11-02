import 'package:architecture_template/common/repositories/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/bloc/settings_bloc.dart';
import 'presentation/settings_page.dart';
import 'presentation/settings_router.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(Provider.of<AuthenticationRepository>(context, listen: false));
    return BlocProvider(
      create: (_) => SettingsBloc(
        authenticationRepository:
            Provider.of<AuthenticationRepository>(context, listen: false),
      ),
      child: SettingsRouter(
        child: SettingsPage(),
      ),
    );
  }
}
