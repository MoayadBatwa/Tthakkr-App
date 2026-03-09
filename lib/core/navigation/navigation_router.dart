import 'package:go_router/go_router.dart';
import 'package:tthakkr_app/core/navigation/nav_bar.dart';
import 'package:tthakkr_app/core/navigation/route_name.dart';
import 'package:tthakkr_app/features/AllahNames/allah_names_screen.dart';
import 'package:tthakkr_app/features/athkar_feature/athkar_category_screen/category_screen.dart';
import 'package:tthakkr_app/features/athkar_feature/athkar_chapter_screen/chapter_screen.dart';
import 'package:tthakkr_app/features/athkar_feature/athkar_screen/athkar_screen.dart';
import 'package:tthakkr_app/features/prayer_time_feature/prayer_time_screen.dart';
import 'package:tthakkr_app/features/qibla_feature/qiblah_screen.dart';

class NavigationRouter {
  NavigationRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: RouteName.prayerTimeScreen,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            NavBar(navigationShell: navigationShell),

        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteName.prayerTimeScreen,
                builder: (context, state) => PrayerTimeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteName.athkarCategoryScreen,
                builder: (context, state) => CategoryScreen(),
                routes: [
                  GoRoute(
                    path: '${RouteName.athkarChapterScreen}/:categoryId',
                    name: RouteName.athkarChapterScreen,
                    builder: (context, state) {
                      final categoryId =
                          int.tryParse(state.pathParameters['categoryId']!) ?? -1;
                      return ChapterScreen(categoryId: categoryId);
                    },
                    routes: [
                      GoRoute(
                    path: '${RouteName.athkarScreen}/:chapterId',
                    name: RouteName.athkarScreen,
                    builder: (context, state) {
                      final chapterId =
                          int.tryParse(state.pathParameters['chapterId']!) ?? -1;
                      return AthkarScreen(chapterId: chapterId);
                    },
                  ),
                    ]
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteName.qiblahScreen,
                builder: (context, state) => QiblahScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteName.allahNamesScreen,
                builder: (context, state) => AllahNamesScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
