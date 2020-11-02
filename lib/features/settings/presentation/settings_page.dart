import 'package:architecture_template/common/theme/theme_provider.dart';
import 'package:architecture_template/components/button_component/button_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/settings_bloc.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return BlocConsumer<SettingsBloc, SettingsState>(
      listener: (context, state) {},
      builder: (context, state) {
        Widget contents = Container();
        if (state is SettingsStateSuccess) {
          contents = Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FlatButton(
                  color: Colors.grey,
                  onPressed: () {
                    BlocProvider.of<SettingsBloc>(context)
                        .add(SettingsEventLogOut());
                  },
                  child: Text(state.buttonLogOutTitle),
                ),
                Row(
                  children: [
                    Text('Light theme'),
                    Switch(
                      value: themeProvider.isLightTheme,
                      onChanged: (value) {
                        //todo: use flutter bloc for that
                        themeProvider.isLightTheme = value;
                      },
                    ),
                  ],
                ),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer.",
                  style: TextStyle(color: themeProvider.theme.accentColor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.accessibility_new,
                      color: themeProvider.theme.accentColor,
                    ),
                    Icon(
                      Icons.account_balance,
                      color: themeProvider.theme.accentColor,
                    ),
                    Icon(
                      Icons.account_box,
                      color: themeProvider.theme.accentColor,
                    )
                  ],
                ),
                Provider(
                  // use key to update ComponentTheme
                  // important, page handles style, bloc handles config?
                  key: UniqueKey(),
                  create: (_) => ComponentTheme(
                    backgroundColor: themeProvider.theme.primaryColor,
                    textStyle:
                        TextStyle(color: themeProvider.theme.accentColor),
                  ),
                  child: ButtonComponent(
                    configuration: ButtonComponentConfiguration(title: 'tap'),
                  ),
                ),
              ],
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(state.title),
          ),
          body: SafeArea(child: contents),
          backgroundColor: themeProvider.theme.backgroundColor,
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
