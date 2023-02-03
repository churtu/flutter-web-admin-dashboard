

import 'package:admin_dashboard/src/providers/sidebar_provider.dart';
import 'package:admin_dashboard/src/ui/views/no_page_found_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class NoPageFoundHandlers {

  static Handler noPageFound = Handler(
    handlerFunc: (context, parameters) {
      Provider.of<SidebarProvider>(context!, listen: false).setCurrentPageUrl('/404');
      return const NoPageFoundView();  
    },
  );
}