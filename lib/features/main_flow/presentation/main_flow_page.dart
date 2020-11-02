import 'package:architecture_template/features/authentication/authentication.dart';
import 'package:architecture_template/features/home_tab/home_tab.dart';
import 'package:architecture_template/features/loading/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/main_flow_bloc.dart';

class MainFlowPage extends StatefulWidget {
  @override
  _MainFlowPageState createState() => _MainFlowPageState();
}

class _MainFlowPageState extends State<MainFlowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MainFlowBloc, MainFlowState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is MainFlowStateAuthentication) {
            return Authentication();
          } else if (state is MainFlowStateHome) {
            return HomeTab();
          }
          return LoadingPage();
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MainFlowBloc>(context).add(MainFlowEventStarted());
  }
}
