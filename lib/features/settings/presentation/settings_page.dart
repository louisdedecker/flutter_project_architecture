import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/settings_bloc.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsBloc, SettingsState>(
      listener: (context, state) {},
      builder: (context, state) {
        Widget contents = Container();
        if (state is SettingsStateSuccess) {
          contents = Column(
            children: [
              FlatButton(
                color: Colors.grey,
                onPressed: () {
                  BlocProvider.of<SettingsBloc>(context)
                      .add(SettingsEventLogOut());
                },
                child: Text(state.buttonLogOutTitle),
              ),
            ],
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(state.title),
          ),
          body: SafeArea(child: contents),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<SettingsBloc>(context).add(SettingsEventStarted());
  }
}
