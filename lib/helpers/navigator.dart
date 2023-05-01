import 'package:flutter/material.dart';

class AppNavigator {
  static final key = GlobalKey<NavigatorState>();
  static NavigatorState get state => key.currentState!;
  static BuildContext get context => key.currentContext!;

  static Future<T?> push<T>(String route, {Object? arguments}) =>
      state.pushNamed<T>(route, arguments: arguments);

  static void popUntilHome() => state.popUntil((route) => route.isFirst);

  static Future<T?> popAllAndPush<T>(String route, {Object? arguments}) =>
      state.pushNamedAndRemoveUntil<T>(
        route,
            (route) => false,
        arguments: arguments,
      );

  static Future<T?> pushReplacement<T, TO>(
      String route, {
        TO? result,
        Object? arguments,
      }) =>
      state.pushReplacementNamed<T, TO>(
        route,
        result: result,
        arguments: arguments,

      );

  static void pop<T>([T? result]) => state.pop<T>(result);

  static Future<T?> dialog<T>(Widget dialog) => showDialog<T>(
    context: context,
    builder: (context) => dialog,
  );
  // static Route<dynamic>? onGeneratedRoute(RouteSettings routeSettings) {
  //   return CupertinoPageRoute<void>(
  //     settings: routeSettings,
  //     builder: (context) {
  //       final route = Uri.parse(routeSettings.name!);
  //       final userLoaded = context.select<AuthController, bool>(
  //             (controller) => controller.userLoaded,
  //       );
  //
  //       if (!userLoaded && route.path != AuthView.routeName) {
  //         return const SplashView();
  //       }
  //
  //       switch (route.path) {
  //         case SplashView.routeName:
  //           return const SplashView();
  //
  //         case AuthView.routeName:
  //           return const AuthView();
  //
  //         case HomeView.routeName:
  //           return const HomeView();
  //
  //         case UserView.routeName:
  //           return const UserView();
  //
  //         case PaymentsView.routeName:
  //           return const PaymentsView();
  //
  //         case PatientsView.routeName:
  //           return const PatientsView();
  //
  //         case PatientView.routeName:
  //           return PatientView(patientId: route.queryParameters['id']);
  //
  //         case AppointmentsView.routeName:
  //           return const AppointmentsView();
  //
  //         case VisitsView.routeName:
  //           return const VisitsView();
  //
  //         case VisitView.routeName:
  //           return VisitView(
  //             visitId: route.queryParameters['visitId'],
  //             appointmentId: route.queryParameters['appointmentId'],
  //             patientId: route.queryParameters['patientId'],
  //             doctorId: route.queryParameters['doctorId'],
  //           );
  //
  //         case TreatmentPlansView.routeName:
  //           return const TreatmentPlansView();
  //
  //         case TreatmentPlanView.routeName:
  //           return TreatmentPlanView(id: route.queryParameters['id']);
  //
  //         case PatientsHistoriesView.routeName:
  //           return const PatientsHistoriesView();
  //
  //         case PatientHistoryView.routeName:
  //           return PatientHistoryView(patientId: route.queryParameters['id']!);
  //
  //         case DoctorsView.routeName:
  //           return const DoctorsView();
  //
  //         case DoctorView.routeName:
  //           return DoctorView(id: route.queryParameters['id']);
  //
  //         case SettingsView.routeName:
  //           return const SettingsView();
  //
  //         case PaymentView.routeName:
  //           return PaymentView(paymentId: route.queryParameters['id']);
  //
  //         default:
  //           return const SizedBox.shrink();
  //       }
  //     },
  //   );
  // }

}
