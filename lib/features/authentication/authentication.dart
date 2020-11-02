import 'package:architecture_template/common/repositories/authentication_repository/authentication_repository.dart';
import 'package:architecture_template/features/main_app/main_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/bloc/authentication_bloc.dart';
import 'presentation/authentication_page.dart';
import 'presentation/authentication_router.dart';
import 'package:provider/provider.dart';

class Authentication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthenticationBloc(
        localizations: MainLocalizations.of(context),
        authenticationRepository:
            Provider.of<AuthenticationRepository>(context),
      ),
      child: AuthenticationRouter(
        child: AuthenticationPage(),
      ),
    );
  }
}
