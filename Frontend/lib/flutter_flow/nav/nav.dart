import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '/backend/supabase/supabase.dart';
import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? HomePageWidget() : WelcomeWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? HomePageWidget() : WelcomeWidget(),
          routes: [
            FFRoute(
              name: 'HomePage',
              path: 'homePage',
              builder: (context, params) => HomePageWidget(),
            ),
            FFRoute(
              name: 'welcome',
              path: 'welcome',
              builder: (context, params) => WelcomeWidget(),
            ),
            FFRoute(
              name: 'signup',
              path: 'signup',
              builder: (context, params) => SignupWidget(),
            ),
            FFRoute(
              name: 'login',
              path: 'login',
              builder: (context, params) => LoginWidget(),
            ),
            FFRoute(
              name: 'checkEmail',
              path: 'checkEmail',
              builder: (context, params) => CheckEmailWidget(),
            ),
            FFRoute(
              name: 'didntReceiveCode',
              path: 'didntReceiveCode',
              builder: (context, params) => DidntReceiveCodeWidget(),
            ),
            FFRoute(
              name: 'linkResend',
              path: 'linkResend',
              builder: (context, params) => LinkResendWidget(),
            ),
            FFRoute(
              name: 'kycSDK',
              path: 'kycSDK',
              builder: (context, params) => KycSDKWidget(),
            ),
            FFRoute(
              name: 'personalinformationLocation',
              path: 'personalinformationLocation',
              builder: (context, params) => PersonalinformationLocationWidget(),
            ),
            FFRoute(
              name: 'personalinformationName',
              path: 'personalinformationName',
              builder: (context, params) => PersonalinformationNameWidget(),
            ),
            FFRoute(
              name: 'enableNotifications',
              path: 'enableNotifications',
              builder: (context, params) => EnableNotificationsWidget(),
            ),
            FFRoute(
              name: 'membershipBanner',
              path: 'membershipBanner',
              builder: (context, params) => MembershipBannerWidget(),
            ),
            FFRoute(
              name: 'membershipOptions',
              path: 'membershipOptions',
              builder: (context, params) => MembershipOptionsWidget(),
            ),
            FFRoute(
              name: 'checkBankAcoount',
              path: 'checkBankAcoount',
              builder: (context, params) => CheckBankAcoountWidget(),
            ),
            FFRoute(
              name: 'accountMembership',
              path: 'accountMembership',
              builder: (context, params) => AccountMembershipWidget(),
            ),
            FFRoute(
              name: 'accountCancelMembership',
              path: 'accountCancelMembership',
              builder: (context, params) => AccountCancelMembershipWidget(),
            ),
            FFRoute(
              name: 'errorConnect',
              path: 'errorConnect',
              builder: (context, params) => ErrorConnectWidget(),
            ),
            FFRoute(
              name: 'connecAnotherAccount',
              path: 'connecAnotherAccount',
              builder: (context, params) => ConnecAnotherAccountWidget(),
            ),
            FFRoute(
              name: 'payScreenPayAll',
              path: 'payScreenPayAll',
              builder: (context, params) => PayScreenPayAllWidget(),
            ),
            FFRoute(
              name: 'loanPreview',
              path: 'loanPreview',
              builder: (context, params) => LoanPreviewWidget(),
            ),
            FFRoute(
              name: 'payScreenPayment',
              path: 'payScreenPayment',
              builder: (context, params) => PayScreenPaymentWidget(),
            ),
            FFRoute(
              name: 'errorPayment',
              path: 'errorPayment',
              builder: (context, params) => ErrorPaymentWidget(),
            ),
            FFRoute(
              name: 'emptyLoans',
              path: 'emptyLoans',
              builder: (context, params) => EmptyLoansWidget(),
            ),
            FFRoute(
              name: 'notificationsDefault',
              path: 'notificationsDefault',
              builder: (context, params) => NotificationsDefaultWidget(),
            ),
            FFRoute(
              name: 'notificationsOpened',
              path: 'notificationsOpened',
              builder: (context, params) => NotificationsOpenedWidget(),
            ),
            FFRoute(
              name: 'accountDefault',
              path: 'accountDefault',
              builder: (context, params) => AccountDefaultWidget(),
            ),
            FFRoute(
              name: 'accountPersonalInfo',
              path: 'accountPersonalInfo',
              builder: (context, params) => AccountPersonalInfoWidget(),
            ),
            FFRoute(
              name: 'accountLanguage',
              path: 'accountLanguage',
              builder: (context, params) => AccountLanguageWidget(),
            ),
            FFRoute(
              name: 'accountFeedbackSubmit',
              path: 'accountFeedbackSubmit',
              builder: (context, params) => AccountFeedbackSubmitWidget(),
            ),
            FFRoute(
              name: 'accountFeedbackWrite',
              path: 'accountFeedbackWrite',
              builder: (context, params) => AccountFeedbackWriteWidget(),
            ),
            FFRoute(
              name: 'accountFeedbackThanks',
              path: 'accountFeedbackThanks',
              builder: (context, params) => AccountFeedbackThanksWidget(),
            ),
            FFRoute(
              name: 'accountSupport',
              path: 'accountSupport',
              builder: (context, params) => AccountSupportWidget(),
            ),
            FFRoute(
              name: 'accountSupportAddNewEmail',
              path: 'accountSupportAddNewEmail',
              builder: (context, params) => AccountSupportAddNewEmailWidget(),
            ),
            FFRoute(
              name: 'accountSupportWrite',
              path: 'accountSupportWrite',
              builder: (context, params) => AccountSupportWriteWidget(),
            ),
            FFRoute(
              name: 'accountContactDetails',
              path: 'accountContactDetails',
              builder: (context, params) => AccountContactDetailsWidget(),
            ),
            FFRoute(
              name: 'limitDefault',
              path: 'limitDefault',
              builder: (context, params) => LimitDefaultWidget(),
            ),
            FFRoute(
              name: 'faqOpen',
              path: 'faqOpen',
              builder: (context, params) => FaqOpenWidget(),
            ),
            FFRoute(
              name: 'paymentCalculator',
              path: 'paymentCalculator',
              builder: (context, params) => PaymentCalculatorWidget(),
            ),
            FFRoute(
              name: 'reachedMaximum',
              path: 'reachedMaximum',
              builder: (context, params) => ReachedMaximumWidget(),
            ),
            FFRoute(
              name: 'SelectBankAccount',
              path: 'selectBankAccount',
              builder: (context, params) => SelectBankAccountWidget(),
            ),
            FFRoute(
              name: 'borrowCheckout',
              path: 'borrowCheckout',
              builder: (context, params) => BorrowCheckoutWidget(),
            ),
            FFRoute(
              name: 'borrowError',
              path: 'borrowError',
              builder: (context, params) => BorrowErrorWidget(),
            ),
            FFRoute(
              name: 'borrowSuccess',
              path: 'borrowSuccess',
              builder: (context, params) => BorrowSuccessWidget(),
            ),
            FFRoute(
              name: 'apporvedForScreen',
              path: 'apporvedForScreen',
              builder: (context, params) => ApporvedForScreenWidget(),
            ),
            FFRoute(
              name: 'needSomeCashWidgetOpen',
              path: 'needSomeCashWidgetOpen',
              builder: (context, params) => NeedSomeCashWidgetOpenWidget(),
            ),
            FFRoute(
              name: 'step1Banner',
              path: 'step1Banner',
              builder: (context, params) => Step1BannerWidget(),
            ),
            FFRoute(
              name: 'step2Banner',
              path: 'step2Banner',
              builder: (context, params) => Step2BannerWidget(),
            ),
            FFRoute(
              name: 'step3Banner',
              path: 'step3Banner',
              builder: (context, params) => Step3BannerWidget(),
            ),
            FFRoute(
              name: 'countrySelect',
              path: 'countrySelect',
              builder: (context, params) => CountrySelectWidget(),
            ),
            FFRoute(
              name: 'bankSelect',
              path: 'bankSelect',
              builder: (context, params) => BankSelectWidget(),
            ),
            FFRoute(
              name: 'bankaccountConnect',
              path: 'bankaccountConnect',
              builder: (context, params) => BankaccountConnectWidget(),
            ),
            FFRoute(
              name: 'accountSupportThanks',
              path: 'accountSupportThanks',
              builder: (context, params) => AccountSupportThanksWidget(),
            ),
            FFRoute(
              name: 'payScreenDefault',
              path: 'payScreenDefault',
              builder: (context, params) => PayScreenDefaultWidget(),
            ),
            FFRoute(
              name: 'waitingScreen',
              path: 'waitingScreen',
              builder: (context, params) => WaitingScreenWidget(),
            ),
            FFRoute(
              name: 'signupCopy',
              path: 'signupCopy',
              builder: (context, params) => SignupCopyWidget(),
            ),
            FFRoute(
              name: 'borrowReachedLimit',
              path: 'borrowReachedLimit',
              builder: (context, params) => BorrowReachedLimitWidget(),
            ),
            FFRoute(
              name: 'paymentCreated',
              path: 'paymentCreated',
              builder: (context, params) => PaymentCreatedWidget(),
            ),
            FFRoute(
              name: 'membershipBannerResubscribe',
              path: 'membershipBannerResubscribe',
              builder: (context, params) => MembershipBannerResubscribeWidget(),
            ),
            FFRoute(
              name: 'membershipOptionsResubscribe',
              path: 'membershipOptionsResubscribe',
              builder: (context, params) =>
                  MembershipOptionsResubscribeWidget(),
            ),
            FFRoute(
              name: 'advanceVerification',
              path: 'advanceVerification',
              builder: (context, params) => AdvanceVerificationWidget(),
            ),
            FFRoute(
              name: 'borrowOptions',
              path: 'borrowOptions',
              builder: (context, params) => BorrowOptionsWidget(),
            ),
            FFRoute(
              name: 'borrowSelectPayday',
              path: 'borrowSelectPayday',
              builder: (context, params) => BorrowSelectPaydayWidget(),
            ),
            FFRoute(
              name: 'Limitpage_step0',
              path: 'limitpageStep0',
              builder: (context, params) => LimitpageStep0Widget(),
            ),
            FFRoute(
              name: 'Limitpage_step1',
              path: 'limitpageStep1',
              builder: (context, params) => LimitpageStep1Widget(),
            ),
            FFRoute(
              name: 'NPSQuestionaire',
              path: 'nPSQuestionaire',
              builder: (context, params) => NPSQuestionaireWidget(),
            ),
            FFRoute(
              name: 'cantServeYouATM',
              path: 'cantServeYouATM',
              builder: (context, params) => CantServeYouATMWidget(),
            ),
            FFRoute(
              name: 'limitError',
              path: 'limitError',
              builder: (context, params) => LimitErrorWidget(),
            ),
            FFRoute(
              name: 'Limitpage_update_step0',
              path: 'limitpageUpdateStep0',
              builder: (context, params) => LimitpageUpdateStep0Widget(),
            ),
            FFRoute(
              name: 'Limitpage_update_step1',
              path: 'limitpageUpdateStep1',
              builder: (context, params) => LimitpageUpdateStep1Widget(),
            ),
            FFRoute(
              name: 'autoSetUpSuccess',
              path: 'autoSetUpSuccess',
              builder: (context, params) => AutoSetUpSuccessWidget(),
            ),
            FFRoute(
              name: 'chooseAnotherPaymentMethod',
              path: 'chooseAnotherPaymentMethod',
              builder: (context, params) => ChooseAnotherPaymentMethodWidget(),
            ),
            FFRoute(
              name: 'paydayPreview',
              path: 'paydayPreview',
              builder: (context, params) => PaydayPreviewWidget(),
            ),
            FFRoute(
              name: 'kycErrorred',
              path: 'kycErrorred',
              builder: (context, params) => KycErrorredWidget(),
            ),
            FFRoute(
              name: 'borrowContactSupport',
              path: 'borrowContactSupport',
              builder: (context, params) => BorrowContactSupportWidget(),
            ),
            FFRoute(
              name: 'step0Banner',
              path: 'step0Banner',
              builder: (context, params) => Step0BannerWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/welcome';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/Logo-min_(1).png',
                    fit: BoxFit.cover,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
