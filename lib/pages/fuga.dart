import 'package:auto_route/auto_route.dart';
import 'package:auto_route_app/router/auth.dart';
import 'package:auto_route_app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final uidProvider = Provider((ref) => ref.watch(authProvider).currentUser?.uid);

@RoutePage()
class FugaScreen extends ConsumerWidget {
  const FugaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uid = ref.watch(uidProvider);
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          onPressed: () async {
            await ref.watch(authProvider).signOut();
            if (context.mounted) {
              AutoRouter.of(context).replace(const HogeRoute());
            }
          },
          icon: const Icon(Icons.logout),
        )
      ], title: const Text('Fuga')),
      body: Center(
        child: Text(uid.toString()),
      ),
    );
  }
}
