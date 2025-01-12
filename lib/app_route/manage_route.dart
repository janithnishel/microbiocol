import 'dart:io';

import 'package:go_router/go_router.dart';
import 'package:microbiocol/desktop/read/home_read.dart';
import 'package:microbiocol/desktop/read/rapid_id.dart';
import 'package:microbiocol/desktop/read/read_sidebar.dart';
import 'package:microbiocol/desktop/read/searchdb.dart';
import 'package:microbiocol/desktop/read/trend.dart';
import 'package:microbiocol/desktop/read/vendor.dart';
import 'package:microbiocol/login_register_pages/splash_screen.dart';

class ManageRoute {
  final route = GoRouter(
    initialLocation: Platform.isWindows ? "/" : "/", //root location of the app

    routes: [
      GoRoute(
        name: "splashScreen",
        path: "/",
        builder: (context, state) => const HomeRead(),
      ),
      // GoRoute(
      //   name: "tt",
      //   path: "/ss",
      //   builder: (context, state) => DetailsPage(),
      // ),

      // this section handle the read side bar
      StatefulShellRoute.indexedStack(
        builder: (context, state, readShell) =>
            ReadSideBar(readShell: readShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: "read",
                path: "/read",
                builder: (context, state) => const HomeRead(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: "home Read",
                path: "/rapidId",
                builder: (context, state) => const RapidId(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: "count",
                path: "/count",
                builder: (context, state) => const RapidId(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: "trend",
                path: "/trend",
                builder: (context, state) => const Trend(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: "search",
                path: "/SearchDB",
                builder: (context, state) => const SearchDB(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: "vendor",
                path: "/Vendor",
                builder: (context, state) => const Vendor(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
