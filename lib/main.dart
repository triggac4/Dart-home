// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:testing/detailsScreen.dart';
import 'package:testing/pageController/learn_page_controller.dart';
import 'package:testing/recommended_conponents.dart';
import './learn.dart';

void main() {
  runApp(const MyApp(title: "Calculator"));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: title,
      routeInformationParser: LearnRouteInfo(),
      routerDelegate: LearnRouteDelegate(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LearnRouteInfo extends RouteInformationParser<LearnPageController> {
  @override
  Future<LearnPageController> parseRouteInformation(
      RouteInformation routeInformation) async {
    var location = routeInformation.location;

    if (location != null) {
      var uri = Uri.parse(location);

      if (uri.pathSegments.length == 1) {
        return LearnPageController.home();
      }
      //detail/id:
      if (uri.pathSegments.length == 2) {
        if (uri.pathSegments[0] == 'detail') {
          LearnPageController.detail(id: uri.pathSegments[1]);
        } else {
          return LearnPageController.unknown();
        }
      }
    }
    return LearnPageController.unknown();
  }

  @override
  RouteInformation? restoreRouteInformation(LearnPageController configuration) {
    if (configuration.isUnknown) {
      return const RouteInformation(location: '/404page');
    } else if (configuration.isHome) {
      return const RouteInformation(location: '/');
    } else if (configuration.isDetail) {
      return RouteInformation(location: '/detail/${configuration.id}');
    }
    return null;
  }
}

class LearnRouteDelegate extends RouterDelegate<LearnPageController>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<LearnPageController> {
  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();

  final List<Recommended> recommendedCompe = [
    {'Chatting': '5 minutes'},
    {'Listen': '5 minutes'},
    {'Speak': '3 minutes'},
    {'Exercise': '30 minutes'},
    {'Eating': '10 minutes'},
    {'Video Games': '30 minutes'},
  ];

  Recommended? recommendedSelected;
  bool show404 = false;

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey,
        pages: [
          MaterialPage(
              key: const ValueKey('home'),
              child: Learn(
                  recommendedComp: recommendedCompe,
                  pageChanger: _handlePageChange)),
          if (show404)
            const MaterialPage(child: Center(child: Text('unknown route')))
          else if (recommendedSelected != null)
            DetailsScreen(recommend: recommendedSelected!)
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            print(result);
            recommendedSelected = null;
            show404 = false;
            notifyListeners();
            return false;
          }

          recommendedSelected = null;
          show404 = false;
          notifyListeners();
          return true;
        });
  }

  _handlePageChange(Recommended comp) {
    recommendedSelected = comp;
    show404 = false;
    notifyListeners();
  }

  @override
  Future<void> setNewRoutePath(LearnPageController configuration) {
    if (configuration.isUnknown) {
      show404 = true;
      return Future.value();
    } else if (configuration.isDetail) {
      show404 = false;
      recommendedSelected = recommendedCompe.firstWhere(
          (element) => element.keys.toList()[0] == configuration.id);
      return Future.value();
    }
    recommendedSelected = null;
    show404 = false;
    return Future.value();
  }
}

class DetailsScreen extends Page {
  final Recommended recommend;
  DetailsScreen({required this.recommend}) : super(key: ValueKey(recommend));
  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this,
        builder: (BuildContext context) {
          return DetailPage(recommend: recommend);
        });
  }
}
