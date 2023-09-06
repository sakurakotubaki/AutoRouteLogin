import 'package:auto_route/auto_route.dart';
import 'package:auto_route_app/pages/fuga.dart';
import 'package:auto_route_app/pages/hoge.dart';

part 'router.gr.dart';// ファイル名と同じ名前にして、.gr.dartをつける

@AutoRouterConfig()
class AppRouter extends _$AppRouter {// _をつけないと怒られる!

 @override
 List<AutoRoute> get routes => [
  // flutter pub run build_runner watch を実行した後にファイルが自動生成されたら、
  // このAutoRouteを追加できる。
    AutoRoute(page: HogeRoute.page, initial: true),
    AutoRoute(page: FugaRoute.page),
  ];
}