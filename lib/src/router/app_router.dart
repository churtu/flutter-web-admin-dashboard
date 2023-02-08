
import 'package:admin_dashboard/src/router/router.dart';
import 'package:fluro/fluro.dart';

class AppRouter {
  static final FluroRouter router = FluroRouter();

  static String initialRoute    = '/';

  // AUTH ROUTES
  static String loginRoute      = '/auth/login';
  static String registerRoute   = '/auth/register';

  // DASHBOARD ROUTES
  static String dashboardRoute      = '/dashboard';
  static String iconsRoute          = '/dashboard/icons';
  static String blankRoute          = '/dashboard/blank';
  static String campaignRoute       = '/dashboard/campaign';
  static String categoriesRoute     = '/dashboard/categories';
  static String customersRoute     = '/dashboard/customers';
  static String customerRoute     = '/dashboard/customers/:uid';
  static String ordersRoute        = '/dashboard/orders';
  static String analyticsRoute     = '/dashboard/analytics';

  static void configureRoutes(){
    // Auth
    router.define( initialRoute,  transitionType: TransitionType.none, handler: AdminHandlers.login);
    router.define( loginRoute,    transitionType: TransitionType.none, handler: AdminHandlers.login);
    router.define( registerRoute, transitionType: TransitionType.none, handler: AdminHandlers.register);

    // Dashboard
    router.define( dashboardRoute,  transitionType: TransitionType.fadeIn, handler: DashboardHandlers.dashboard);
    router.define( iconsRoute,      transitionType: TransitionType.fadeIn, handler: DashboardHandlers.icons);
    router.define( blankRoute,      transitionType: TransitionType.fadeIn, handler: DashboardHandlers.blank);
    router.define( campaignRoute,   transitionType: TransitionType.fadeIn, handler: DashboardHandlers.campaign);
    router.define( categoriesRoute, transitionType: TransitionType.fadeIn, handler: DashboardHandlers.categories);
    router.define( customersRoute, transitionType: TransitionType.fadeIn, handler: DashboardHandlers.customers);
    router.define( customerRoute, transitionType: TransitionType.fadeIn, handler: DashboardHandlers.customer);
    router.define( ordersRoute,    transitionType: TransitionType.fadeIn, handler: DashboardHandlers.orders);
    router.define( analyticsRoute, transitionType: TransitionType.fadeIn, handler: DashboardHandlers.analytics);

    // 404

    router.notFoundHandler = NoPageFoundHandlers.noPageFound;

  }
}