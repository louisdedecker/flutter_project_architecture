import 'package:architecture_template/features/home/home.dart';
import 'package:architecture_template/features/settings/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/home_tab_bloc.dart';

class HomeTabPage extends StatefulWidget {
  @override
  _HomeTabPageState createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeTabBloc, HomeTabState>(
      listener: (context, state) {},
      builder: (context, state) {
        return CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                label: 'home',
                icon: Icon(Icons.event),
              ),
              BottomNavigationBarItem(
                label: 'settings',
                icon: Icon(Icons.settings),
              ),
            ],
          ),
          tabBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return CupertinoTabView(
                builder: (BuildContext context) {
                  return CupertinoPageScaffold(
                    child: Home(),
                  );
                },
              );
            } else {
              return CupertinoTabView(
                builder: (BuildContext context) {
                  return CupertinoPageScaffold(
                    child: Settings(),
                  );
                },
              );
            }
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeTabBloc>(context).add(HomeTabEventStarted());
  }
}
