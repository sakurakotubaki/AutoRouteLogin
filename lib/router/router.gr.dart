// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    FugaRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FugaScreen(),
      );
    },
    HogeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HogeScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
  };
}

/// generated route for
/// [FugaScreen]
class FugaRoute extends PageRouteInfo<void> {
  const FugaRoute({List<PageRouteInfo>? children})
      : super(
          FugaRoute.name,
          initialChildren: children,
        );

  static const String name = 'FugaRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HogeScreen]
class HogeRoute extends PageRouteInfo<void> {
  const HogeRoute({List<PageRouteInfo>? children})
      : super(
          HogeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HogeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
