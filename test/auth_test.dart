import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:silend/DatabaseMethods/auth_methods.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';

class MockUser extends Mock implements User {}

final MockUser _mockUser = MockUser();

class MockFirebaseAuth extends Mock implements FirebaseAuth {
  @override
  Stream<User> authStateChanges() {
    return Stream.fromIterable([
      _mockUser,
    ]);
  }
}

class MockFirestore extends Mock implements FirebaseFirestore {}

void main() async {
  MockFirestore instance;
  setupFirebaseAuthMocks();
  setUp(() async {
    instance = MockFirestore();
    await Firebase.initializeApp();
  });
  final MockFirebaseAuth mockFirebaseAuth = MockFirebaseAuth();
  final AuthMethod auth = AuthMethod(auth: mockFirebaseAuth);

  tearDown(() {});

  test("emit occurs", () async {
    expectLater(auth.user, emitsInOrder([_mockUser]));
  });

  test("create account", () async {
    when(
      mockFirebaseAuth.createUserWithEmailAndPassword(
          email: "tadas@gmail.com", password: "123456"),
    ).thenAnswer((realInvocation) {
      return MockFirebaseAuth().getRedirectResult();
    });

    expect(
        await auth.signupWithEmailAndPassword(
            email: "tadas@gmail.com", password: "123456"),
        "Success");
  });

  test("create account exception", () async {
    when(
      mockFirebaseAuth.createUserWithEmailAndPassword(
          email: "tadas@gmail.com", password: "123456"),
    ).thenAnswer((realInvocation) =>
        throw FirebaseAuthException(message: "You screwed up", code: ''));

    expect(await auth.loginWithEmailAndPassword("tadas@gmail.com", "123456"),
        "You screwed up");
  });

  test("sign in", () async {
    when(
      mockFirebaseAuth.signInWithEmailAndPassword(
          email: "tadas@gmail.com", password: "123456"),
    ).thenAnswer((realInvocation) => MockFirebaseAuth().getRedirectResult());

    expect(await auth.loginWithEmailAndPassword("tadas@gmail.com", "123456"),
        "Success");
  });

  test("sign in exception", () async {
    when(
      mockFirebaseAuth.signInWithEmailAndPassword(
          email: "tadas@gmail.com", password: "123456"),
    ).thenAnswer((realInvocation) =>
        throw FirebaseAuthException(message: "You screwed up", code: ''));

    expect(
        await auth.signupWithEmailAndPassword(
          email: "tadas@gmail.com",
          password: "123456",
        ),
        "You screwed up");
  });

  test("sign out", () async {
    when(
      mockFirebaseAuth.signOut(),
    ).thenAnswer((realInvocation) => MockFirebaseAuth().getRedirectResult());

    expect(await auth.signOut(), "Success");
  });

  test("create account exception", () async {
    when(
      mockFirebaseAuth.signOut(),
    ).thenAnswer((realInvocation) =>
        throw FirebaseAuthException(message: "You screwed up", code: ''));

    expect(await auth.signOut(), "You screwed up");
  });
}

typedef Callback = void Function(MethodCall call);

void setupFirebaseAuthMocks([Callback? customHandlers]) {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelFirebase.channel.setMockMethodCallHandler((call) async {
    if (call.method == 'Firebase#initializeCore') {
      return [
        {
          'name': defaultFirebaseAppName,
          'options': {
            'apiKey': '123',
            'appId': '123',
            'messagingSenderId': '123',
            'projectId': '123',
          },
          'pluginConstants': {},
        }
      ];
    }

    if (call.method == 'Firebase#initializeApp') {
      return {
        'name': call.arguments['appName'],
        'options': call.arguments['options'],
        'pluginConstants': {},
      };
    }

    if (customHandlers != null) {
      customHandlers(call);
    }

    return null;
  });
}

Future<T> neverEndingFuture<T>() async {
  // ignore: literal_only_boolean_expressions
  while (true) {
    await Future.delayed(const Duration(minutes: 5));
  }
}
