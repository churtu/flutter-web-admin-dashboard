
import 'package:admin_dashboard/src/router/router.dart';
import 'package:fluro/fluro.dart';

class AppRouter {
  static final FluroRouter router = FluroRouter();

  static String initialRoute    = '/';

  // AUTH ROUTES
  static String loginRoute      = '/auth/login';
  static String registerRoute   = '/auth/register';

  // DASHBOARD ROUTES
  static String dashboardRoute  = '/dashboard';

  static void configureRoutes(){
    // Auth
    router.define( initialRoute,  transitionType: TransitionType.none, handler: AdminHandlers.login);
    router.define( loginRoute,    transitionType: TransitionType.none, handler: AdminHandlers.login);
    router.define( registerRoute, transitionType: TransitionType.none, handler: AdminHandlers.register);

    // Dashboard
    router.define(dashboardRoute, transitionType: TransitionType.fadeIn, handler: DashboardHandlers.dashboard);

    // 404

    router.notFoundHandler = NoPageFoundHandlers.noPageFound;

  }
}