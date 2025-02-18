import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../handlers/main_handler.dart';
import 'post_route.dart';
import 'auth_route.dart';

class MainRoute {
  Router get route {
    final appRoute = Router();
    appRoute
      ..get("/", rootHandler)
      ..mount("/auth", AuthRoute().route)
      ..mount("/post", PostRoutes().route)
      ..all("/<ignored|.*>", (Request req) {
        return Response.ok("soryy not found page");
      });
    return appRoute;
  }
}