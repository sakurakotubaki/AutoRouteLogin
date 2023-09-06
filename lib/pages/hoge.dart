import 'package:auto_route/auto_route.dart';
import 'package:auto_route_app/router/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final emailProvider = StateProvider((ref) => TextEditingController());
final passwordProvider = StateProvider((ref) => TextEditingController());

@RoutePage()
class HogeScreen extends ConsumerWidget {
  const HogeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(emailProvider);
    final password = ref.watch(passwordProvider);

    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            TextFormField(
              controller: email,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextFormField(
              controller: password,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            ElevatedButton(
              child: const Text('Login'),
              onPressed: () async {
                await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: email.text,
                  password: password.text,
                );
                email.clear();
                password.clear();
                if (context.mounted) {
                  AutoRouter.of(context).replace(const FugaRoute());
                }
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  final auth = FirebaseAuth.instance.currentUser;
                  if (auth?.uid == null) {
                    AlertDialog(
                      title: const Text('ログインしてません!'),
                      content: const Text('ログインしてから再度お試しください'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            AutoRouter.of(context).pop();
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  }
                  AutoRouter.of(context).replace(const FugaRoute());
                },
                child: const Text('ログインせずに画面遷移')),
          ],
        ));
  }
}
