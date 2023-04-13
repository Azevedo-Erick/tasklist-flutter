import 'package:avaliacao_mobile/ui/android/screens/login.screen.dart';
import 'package:avaliacao_mobile/ui/android/screens/tasks_form.screen.dart';
import 'package:flutter/material.dart';

import '../ui/android/screens/overview.screen.dart';
import '../ui/android/screens/task_details.screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/overview':
        return MaterialPageRoute(builder: (_) => OverviewScreen());
      case '/task/details':
        return MaterialPageRoute(builder: (_) => TaskDetails());
      case '/task/new':
        return MaterialPageRoute(builder: (_) => TasksFormScreen());
      case '/task/update/{}':
        return MaterialPageRoute(builder: (_) => TasksFormScreen());
    }
    return _errorRoute();
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
