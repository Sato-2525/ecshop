import 'package:ecshop_techpit/model/login_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeHeader extends ConsumerWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final loginUser = ref.watch(loginUserProvider);
    final loginUserName = ref.watch(loginUserNameProvider);
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ' Welcome, $loginUserName',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Summer Collection 2022 is now available',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
