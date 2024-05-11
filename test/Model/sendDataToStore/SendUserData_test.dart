import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frist_file_taj_alwaqar/Controller/Login&signincontroller/SigninController.dart';
import 'package:get/get.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    Get.testMode = true;
  });
  test('test send user data', () async {
    final firestore = FakeFirebaseFirestore();
    userInfo userAccounet = userInfo(
      uid: '123456',
      username: 'user',
      firstname: 'user',
      lastname: 'user',
      age: 30,
      phonenumber: 1234567890,
      levelstd: 'University',
      email: 'user@ggg.com',
      password: 'password123',
      groupUid: '',
    );
    await firestore.collection('user').add(userAccounet.convetToMap());
    final querySnapshot = await firestore.collection('user').get();
    final documentSnapshot = querySnapshot.docs.first;
    final retrievedMessage = userInfo.fromFirestore(documentSnapshot);

     expect(retrievedMessage.username, userAccounet.username);
    expect(retrievedMessage.uid, userAccounet.uid);
    expect(retrievedMessage.email, userAccounet.email);
    expect(retrievedMessage.password, userAccounet.password);
 
  });
}
