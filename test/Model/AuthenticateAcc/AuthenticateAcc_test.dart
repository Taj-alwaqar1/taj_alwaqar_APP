import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockFirestore extends Mock implements FirebaseFirestore {}

class MockUserCredential extends Mock implements UserCredential {}

class MockFirebaseUser extends Mock implements User {}

class MockFirebaseAuth extends Mock implements FirebaseAuth {
  @override
  Future<UserCredential> createUserWithEmailAndPassword({
    required String? email,
    required String? password,
  }) =>
      super.noSuchMethod(
          Invocation.method(#createUserWithEmailAndPassword, [email, password]),
          returnValue: Future.value(MockUserCredential()));
  @override
  Future<UserCredential> signInWithEmailAndPassword({
    required String? email,
    required String? password,
  }) =>
      super.noSuchMethod(
          Invocation.method(#signInWithEmailAndPassword, [email, password]),
          returnValue: Future.value(MockUserCredential()));
 @override
  Future<void> signOut() async {
    super.noSuchMethod(Invocation.method(#signOut,[]), returnValue: Future.value());
  }
  @override
  Future<void> currentUserSignOut() async {
    super.noSuchMethod(Invocation.method(#currentUserSignOut, []), returnValue: Future.value());
  }
}

void main() {
  late MockFirebaseAuth mockAuth;
  late MockFirestore mockFirestore;
  late MockUserCredential mockCredential;

  setUp(() {
    mockAuth = MockFirebaseAuth();
    mockFirestore = MockFirestore();
    mockCredential = MockUserCredential();
    when(mockCredential.user)
        .thenReturn(MockUser());  
  });

  test("Flutter test", () async {
    when(mockAuth.createUserWithEmailAndPassword(
            email: "email", password: "password"))
        .thenAnswer((realInvocation) async => Future.value(mockCredential));
 
    final result = await mockAuth.createUserWithEmailAndPassword(
        email: 'email', password: 'password');
    expect(result, mockCredential);
    verify(mockAuth.createUserWithEmailAndPassword(
        email: "email", password: "password"));
  });
  test("create account", () async {
    when(
      mockAuth.createUserWithEmailAndPassword(
          email: "tadas@gmail.com", password: "123456"),
    ).thenAnswer((realInvocation) => Future.value(mockCredential));

    expect(
        await mockAuth.createUserWithEmailAndPassword(
            email: "tadas@gmail.com", password: "123456"),
        mockCredential);
  });
  test("Flutter test - Failure scenario", () async {
    final errorMessage = "Failed to create user";

    when(mockAuth.createUserWithEmailAndPassword(
      email: "invalid_email",
      password: "invalid_password",
    )).thenThrow(
        FirebaseAuthException(message: errorMessage, code: "error_code"));

    try {
      await mockAuth.createUserWithEmailAndPassword(
        email: "invalid_email",
        password: "invalid_password",
      );
      fail("Exception should have been thrown");
    } catch (e) {
      expect(e, isA<FirebaseAuthException>());
      expect(e.toString(), contains(errorMessage));
    }

    verify(mockAuth.createUserWithEmailAndPassword(
      email: "invalid_email",
      password: "invalid_password",
    ));
  });
  test("Flutter test - Sign in success", () async {
    final credential = MockUserCredential();

    when(mockAuth.signInWithEmailAndPassword(
      email: "valid_email",
      password: "valid_password",
    )).thenAnswer((_) async => credential);

    final result = await mockAuth.signInWithEmailAndPassword(
      email: "valid_email",
      password: "valid_password",
    );

    expect(result, credential);

    verify(mockAuth.signInWithEmailAndPassword(
      email: "valid_email",
      password: "valid_password",
    ));
  });

  test("Flutter test - Sign in failure", () async {
    final errorMessage = "Failed to sign in";

    when(mockAuth.signInWithEmailAndPassword(
      email: "invalid_email",
      password: "invalid_password",
    )).thenThrow(
        FirebaseAuthException(message: errorMessage, code: 'error_code'));

    try {
      await mockAuth.signInWithEmailAndPassword(
        email: "invalid_email",
        password: "invalid_password",
      );
      fail("Exception should have been thrown");
    } catch (e) {
      expect(e, isA<FirebaseAuthException>());
      expect(e.toString(), contains(errorMessage));
    }

    verify(mockAuth.signInWithEmailAndPassword(
      email: "invalid_email",
      password: "invalid_password",
    ));
  });

 test("Flutter test - Sign out success", () async {
  await mockAuth.signOut();

  // Assert the expected behavior for sign out
});

test("Flutter test - Current User Sign out success", () async {
  await mockAuth.currentUserSignOut();

  // Assert the expected behavior for current user sign out
});
test('signOut should call FirebaseAuth.signOut', () async {
    await mockAuth.signOut();

    verify(mockAuth.signOut()).called(1);
  });
}
