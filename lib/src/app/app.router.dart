// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, unused_import, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/views/blank_view.dart';
import '../ui/views/checklist_item/checklist_item_view.dart';
import '../ui/views/create_checklist/create_checklist_view.dart';
import '../ui/views/home/home_view.dart';
import '../ui/views/login/login_view.dart';
import '../ui/views/main/main_view.dart';
import '../ui/views/profile/profile_view.dart';
import '../ui/views/sign_up/sign_up_view.dart';
import '../ui/views/splash_screen/splash_screen_view.dart';

class Routes {
  static const String splashScreenView = '/';
  static const String signUpView = '/sign-up-view';
  static const String loginView = '/login-view';
  static const String mainView = '/main-view';
  static const String homeView = '/home-view';
  static const String blankView = '/blank-view';
  static const String profileView = '/profile-view';
  static const String checklistItemView = '/checklist-item-view';
  static const String createChecklistView = '/create-checklist-view';
  static const all = <String>{
    splashScreenView,
    signUpView,
    loginView,
    mainView,
    homeView,
    blankView,
    profileView,
    checklistItemView,
    createChecklistView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashScreenView, page: SplashScreenView),
    RouteDef(Routes.signUpView, page: SignUpView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.mainView, page: MainView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.blankView, page: BlankView),
    RouteDef(Routes.profileView, page: ProfileView),
    RouteDef(Routes.checklistItemView, page: ChecklistItemView),
    RouteDef(Routes.createChecklistView, page: CreateChecklistView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    SplashScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SplashScreenView(),
        settings: data,
      );
    },
    SignUpView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const SignUpView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const LoginView(),
        settings: data,
      );
    },
    MainView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const MainView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    BlankView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const BlankView(),
        settings: data,
      );
    },
    ProfileView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const ProfileView(),
        settings: data,
      );
    },
    ChecklistItemView: (data) {
      var args = data.getArgs<ChecklistItemViewArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => ChecklistItemView(
          key: args.key,
          checklistId: args.checklistId,
        ),
        settings: data,
      );
    },
    CreateChecklistView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const CreateChecklistView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// ChecklistItemView arguments holder class
class ChecklistItemViewArguments {
  final Key? key;
  final int checklistId;
  ChecklistItemViewArguments({this.key, required this.checklistId});
}

/// ************************************************************************
/// Extension for strongly typed navigation
/// *************************************************************************

extension NavigatorStateExtension on NavigationService {
  Future<dynamic> navigateToSplashScreenView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.splashScreenView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToSignUpView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.signUpView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToLoginView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.loginView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToMainView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.mainView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToHomeView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.homeView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToBlankView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.blankView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToProfileView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.profileView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToChecklistItemView({
    Key? key,
    required int checklistId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.checklistItemView,
      arguments: ChecklistItemViewArguments(key: key, checklistId: checklistId),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToCreateChecklistView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.createChecklistView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }
}
