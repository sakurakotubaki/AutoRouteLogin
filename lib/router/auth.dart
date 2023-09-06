import 'package:auto_route/auto_route.dart';
import 'package:auto_route_app/router/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = Provider((ref) => FirebaseAuth.instance);
final authStateProvider =
    StreamProvider((ref) => ref.watch(authProvider).authStateChanges());
final authGuardProvider = Provider((ref) => AuthGuard(ref: ref));

class AuthGuard extends AutoRouteGuard {
  Ref ref;
  AuthGuard({required this.ref});
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // resolver.next()が呼び出されるまで、ナビゲーションは一時停止されます。
    // ナビゲーションを再開/継続するにはtrueを、ナビゲーションを中止するにはfalseを返します。
    // authenticatedは、FirebaseAuthの現在のユーザーがnullでない場合にtrueになります。
    final authenticated = ref.watch(authStateProvider).valueOrNull;
    // ユーザーが認証されているかどうかをチェックします。
    if (authenticated != null) {
      // ユーザーが認証された場合、続行する
      resolver.next(true);
    } else {
      // ユーザーをログインページにリダイレクトする
      // tip: resolver.redirectを使用して、リダイレクトされたルート
      // リゾルバが完了したときにスタックから自動的に削除されます。
      resolver.redirect(const HogeRoute());
    }
  }
}
