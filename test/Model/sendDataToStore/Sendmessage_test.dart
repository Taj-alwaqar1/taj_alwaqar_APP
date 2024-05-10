// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frist_file_taj_alwaqar/Controller/pagesController/createHalaqhController.dart';
import 'package:frist_file_taj_alwaqar/Controller/pagesController/messageController.dart';
import 'package:frist_file_taj_alwaqar/Model/sendDataToStore/createHalaqhModel.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    Get.testMode = true;
  });

  test('send massage data to firestore test (pass)', () async {
    final firestore = FakeFirebaseFirestore();
    var massage = msg(
      from_uid: '1',
      to_uid: '2',
      from_name: 'user1',
      to_name: 'user2',
      last_msg: 'Hello, how are you?',
      last_time: Timestamp.now(),
      msg_num: 5,
    );

    await firestore.collection('message').add(massage.toFirestore());
    final querySnapshot = await firestore.collection('message').get();
    final documentSnapshot = querySnapshot.docs.first;
    final retrievedMessage = msg.fromFirestore(documentSnapshot, null);

    expect(retrievedMessage.from_uid, massage.from_uid);
    expect(retrievedMessage.to_uid, massage.to_uid);
    expect(retrievedMessage.from_name, massage.from_name);
    expect(retrievedMessage.to_name, massage.to_name);
    expect(retrievedMessage.last_msg, massage.last_msg);
  });

test('send massage data to firestore test (fail - no data)', () async {
  final firestore = FakeFirebaseFirestore(); // Mock Firestore instance

  var message = msg(
    from_uid: '1',
    to_uid: '2',
    from_name: 'user1',
    to_name: 'user2',
    last_msg: 'Hello, how are you?',
    last_time: Timestamp.now(),
    msg_num: 5,
  );

 
  final querySnapshot = await firestore.collection('message').get();
 
  expect(querySnapshot.docs.isEmpty, true);  
});
}
