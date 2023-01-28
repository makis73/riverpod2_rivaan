import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod2_rivaan/main.dart';
import 'package:riverpod2_rivaan/user.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // return ref.watch(fetchUserProvider).when(
    //   data: (data) {
    //     return Scaffold(
    //       appBar: AppBar(),
    //       body: Column(
    //         children: [
    //           Center(child: Text(data.name),)
    //         ],
    //       ),
    //     );
    //   },
    //   error: (error, stackTrace) {
    //     return Scaffold(
    //       body: Center(
    //         child: Text(error.toString()),
    //       ),
    //     );
    //   },
    //   loading: () {
    //     return const Scaffold(
    //       body: Center(
    //         child: CircularProgressIndicator(),
    //       ),
    //     );
    //   },
    // );
    return Scaffold(
      body: ref.watch(streamCounter).when(
        data: ((data) {
          return Center(
            child: Text(data.toString()),
          );
        }),
        error: ((error, stackTrace) {
          return Center(child: CircularProgressIndicator());
        }),
        loading: () {
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
