import 'package:flutter/material.dart';
import 'package:museum_guide/models/agenda_item.dart';
import 'package:museum_guide/screens/detail.dart';
import 'package:museum_guide/screens/intro.dart';
import 'package:museum_guide/screens/menu.dart';

class AppNavigator extends StatelessWidget {
  static const String intro = '/';
  static const String menu = '/menu';
  static const String detail = '/detail';
  
  AppNavigator();
  
  static const opacityCurve =
      const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);
  
  Route<void> routeToDetail(RouteSettings settings)
  {
    AgendaItem item = settings.arguments as AgendaItem;
    Widget widget = DetailPage(item: item);
    return MaterialPageRoute<void>(builder: (context) => widget);
  }

  Route<void> routeToIntro(RouteSettings settings) {
    Widget widget = IntroPage();
    return MaterialPageRoute<void>(builder: (context) => widget);
  }

  Route<void> routeToMenu(RouteSettings settings) {
    Widget widget = MenuPage();
    return MaterialPageRoute<void>(builder: (context) => widget);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
        initialRoute: intro,
        onGenerateRoute: (RouteSettings routeSettings)
        {
          if(routeSettings.name == detail)
          {
            return routeToDetail(routeSettings);
          }
          if(routeSettings.name == menu)
          {
            return routeToMenu(routeSettings);
          }
          return routeToIntro(routeSettings);
        }
    );
  }
}