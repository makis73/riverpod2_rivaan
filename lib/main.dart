import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod2_rivaan/home_page.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod2_rivaan/user.dart';

final fetchUserProvider = FutureProvider(((ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.fetchUserData();
}));

final streamCounter = StreamProvider(
  (ref) {
    final counter = ref.watch(streamProvider);
    return counter.timedCounter();
  },
);

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Riverpod2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
