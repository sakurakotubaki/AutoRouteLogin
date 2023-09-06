import 'package:auto_route/auto_route.dart';
import 'package:auto_route_app/pages/fuga.dart';
import 'package:auto_route_app/pages/hoge.dart';
import 'package:auto_route_app/pages/home.dart';
import 'package:auto_route_app/router/auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'router.gr.dart'; // ファイル名と同じ名前にして、.gr.dartをつける

final appRouterProvider = Provider((ref) => AppRouter(ref: ref));

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  // _をつけないと怒られる!
  Ref ref;
  AppRouter({required this.ref});

  @override
  List<AutoRoute> get routes => [
        // flutter pub run build_runner watch を実行した後にファイルが自動生成されたら、
        // このAutoRouteを追加できる。
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: HogeRoute.page),
        AutoRoute(page: FugaRoute.page, guards: [AuthGuard(ref: ref)]),
      ];
}
