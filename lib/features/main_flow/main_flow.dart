import 'package:architecture_template/common/repositories/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/bloc/main_flow_bloc.dart';
import 'presentation/main_flow_page.dart';
import 'package:provider/provider.dart';

class MainFlow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MainFlowBloc(
        authenticationRepository:
            Provider.of<AuthenticationRepository>(context, listen: false),
      ),
      child: MainFlowPage(),
    );
  }
}
