
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

    // router.define(initialRoute, handler: handler)

    // Auth
    router.define( loginRoute,    transitionType: TransitionType.none, handler: AdminHandlers.login);
    router.define( initialRoute,  transitionType: TransitionType.none, handler: AdminHandlers.login);
    router.define( registerRoute, transitionType: TransitionType.none, handler: AdminHandlers.register);

    // 404

    router.notFoundHandler = NoPageFoundHandlers.noPageFound;

  }
}