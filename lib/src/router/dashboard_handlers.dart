
import 'package:admin_dashboard/src/providers/providers.dart';
import 'package:admin_dashboard/src/ui/views/views.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class DashboardHandlers {
  static Handler dashboard = Handler(
    handlerFunc: (context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);
      if(authProvider.authStatus == AuthStatus.authenticated){
        return const DashboardView(); 
      }
      return const LoginView();
    },
  );
}