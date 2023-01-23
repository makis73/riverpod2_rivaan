import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod2_rivaan/main.dart';
import 'package:riverpod2_rivaan/user.dart';

/// Provider and Methods to read a provider:
/// ----------------------------
/// 1. Using ConsumerWidget

// final nameProvider = Provider<String>((ref) => "Makis Makrodi");

// class HomePage extends ConsumerWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final name = ref.watch(nameProvider);
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [
//           Center(
//             child: Text(name),
//           )
//         ],
//       ),
//     );
//   }
// }

/// 2. Using Consumer as widget (body: Consumer(...))

// final nameProvider = Provider<String>((ref) => "Makis ");

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Consumer(builder: (context, ref, child) {
//         final name = ref.watch(nameProvider);
//         return Column(
//           children: [
//             Center(
//               child: Text(name),
//             )
//           ],
//         );
//       }),
//     );
//   }
// }

/// 3. If its StatefulWidget
/// StatefuleWidget => ConsumerStatefulWidget
/// State<MyWidget> => ConsumerState<MyWidget>

// final nameProvider = Provider<String>((ref) => "Makis Makrodi");

// class HomePage extends ConsumerStatefulWidget {
//   const HomePage({super.key});

//   @override
//   ConsumerState<HomePage> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends ConsumerState<HomePage> {

//   @override
//   Widget build(BuildContext context) {
//   final name = ref.watch(nameProvider);
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [
//           Center(
//             child: Text(name),
//           )
//         ],
//       ),
//     );
//   }
// }

/// StateProvider
/// -------------

// final nameProvider = StateProvider<String?>((ref) => null);

// class HomePage extends ConsumerWidget {
//   const HomePage({super.key});

//   void onSubmit(WidgetRef ref, String value) {
//     ref.read(nameProvider.notifier).update((state) => value);
//   }

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final name = ref.watch(nameProvider) ?? '';

//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [
//           TextField(
//             onSubmitted: (value) => onSubmit(ref, value),
//           ),
//           Center(
//             child: Text(name),
//           )
//         ],
//       ),
//     );
//   }
// }

/// StateNotifier and StateNotifierProvider
/// ---------------------------------------

final userProvider = StateNotifierProvider<UserNotifier, User>(
  (ref) => UserNotifier(
    const User(name: '', age: 0),
  ),
);

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  void onSubmit(WidgetRef ref, String value) {
    ref.read(userProvider.notifier).updateName(value);
  }

  void onSubmitAge(WidgetRef ref, String value) {
    ref.read(userProvider.notifier).updateAge(int.parse(value));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Column(
        children: [
          TextField(
            onSubmitted: (value) => onSubmit(ref, value),
          ),
          TextField(
            onSubmitted: (value) => onSubmitAge(ref, value),
          ),
          Center(
            child: Text(user.age.toString()),
          )
        ],
      ),
    );
  }
}
