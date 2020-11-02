import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ComponentTheme {
  Color color;
  Color backgroundColor;
  TextStyle textStyle;

  ComponentTheme({
    this.color,
    this.backgroundColor,
    this.textStyle,
  });
}

class ButtonComponentFactory {}

class ButtonComponentConfiguration {
  final String title;

  ButtonComponentConfiguration({
    @required this.title,
  });
}

class ButtonComponent extends StatelessWidget {
  final ButtonComponentConfiguration configuration;

  const ButtonComponent({Key key, @required this.configuration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ComponentTheme>(context);
    print(theme.backgroundColor);

    return Container(
      color: theme.backgroundColor,
      child: Text(
        configuration.title,
        style: theme.textStyle,
      ),
    );
  }
}
