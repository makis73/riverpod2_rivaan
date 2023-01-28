// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class User {
  final String name;
  final String email;
  const User({
    required this.name,
    required this.email,
  });

  User copyWith({
    String? name,
    String? email,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(name: $name, email: $email)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.name == name && other.email == email;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode;
}

final userRepositoryProvider = Provider((ref) => UserRepository());

class UserRepository {
  Future<User> fetchUserData() {
    const url = 'https://jsonplaceholder.typicode.com/users/1';

    return http.get(Uri.parse(url)).then((value) => User.fromJson(value.body));
  }
}

// Do this in order to avoid call the [StramRepository] class all the time. 
// The streamProvider will cach the class.
final streamProvider = Provider((ref) => StreamRepository());

class StreamRepository {
  Stream<int> timedCounter() async* {
    print('STreamRepository called!!!');
    int i = 0;
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield i++;
      if (i == 10) break;
    }
  }
}



// class UserNotifier extends StateNotifier<User> {
//   UserNotifier(super.state);

//   void updateName(String n) {
//     state = state.copyWith(name: n);
//   }

//   void updateAge(String e) {
//     state = state.copyWith(email: e);
//   }
// }
