
import 'package:admin_dashboard/src/providers/providers.dart';
import 'package:admin_dashboard/src/router/app_router.dart';
import 'package:admin_dashboard/src/ui/views/views.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class DashboardHandlers {
  static Handler dashboard = Handler(
    handlerFunc: (context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SidebarProvider>(context, listen: false).setCurrentPageUrl(AppRouter.dashboardRoute);
      if(authProvider.authStatus == AuthStatus.authenticated){
        return const DashboardView(); 
      }
      return const LoginView();
    },
  );

  static Handler icons = Handler(
    handlerFunc: (context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SidebarProvider>(context, listen: false).setCurrentPageUrl(AppRouter.iconsRoute);
      if(authProvider.authStatus == AuthStatus.authenticated){
        return const IconsView(); 
      }
      return const LoginView();
    },
  );

  static Handler blank = Handler(
    handlerFunc: (context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SidebarProvider>(context, listen: false).setCurrentPageUrl(AppRouter.blankRoute);
      if(authProvider.authStatus == AuthStatus.authenticated){
        return const BlankView(); 
      }
      return const LoginView();
    },
  );

  static Handler campaign = Handler(
    handlerFunc: (context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SidebarProvider>(context, listen: false).setCurrentPageUrl(AppRouter.campaignRoute);
      if(authProvider.authStatus == AuthStatus.authenticated){
        return const CampaignView(); 
      }
      return const LoginView();
    },
  );

  static Handler categories = Handler(
    handlerFunc: (context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SidebarProvider>(context, listen: false).setCurrentPageUrl(AppRouter.categoriesRoute);
      if(authProvider.authStatus == AuthStatus.authenticated){
        return const CategoriesView(); 
      }
      return const LoginView();
    },
  );
}