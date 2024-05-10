import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frist_file_taj_alwaqar/Controller/pagesController/createHalaqhController.dart';
import 'package:frist_file_taj_alwaqar/Model/sendDataToStore/createHalaqhModel.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    Get.testMode = true;
  });

  test('set HalaqhData to Firestore pass', () async {
    final firestore = FakeFirebaseFirestore();
    final halaqh1 = halaqh(
      mosqueName: 'Masjid Al-Rahman',
      halqahName: 'Quran Memorization',
      teacherName: 'Imam Omar',
      halaqhDays: 'MWF',
      halqahTime: '07:00 PM',
      teacheruid: '123456',
      senderId: '987654',
      groupId: 'abc123',
      lastMessage: '',
      membersUid: ['456789', '012345'],
      timeSent: DateTime.now(),
    );
    await firestore.collection('halaqh').add(halaqh1.toMap());
    final querySnapshot = await firestore.collection('halaqh').get();
    final documentSnapshot = querySnapshot.docs.first;
    final retrievedHalaqh = halaqh.fromMap(documentSnapshot.data());
    expect(retrievedHalaqh.mosqueName, halaqh1.mosqueName);
    expect(retrievedHalaqh.halqahName, halaqh1.halqahName);
    expect(retrievedHalaqh.teacherName, halaqh1.teacherName);
    expect(retrievedHalaqh.halaqhDays, halaqh1.halaqhDays);
    expect(retrievedHalaqh.halqahTime, halaqh1.halqahTime);
    expect(retrievedHalaqh.teacheruid, halaqh1.teacheruid);
    expect(retrievedHalaqh.senderId, halaqh1.senderId);
    expect(retrievedHalaqh.groupId, halaqh1.groupId);
    expect(retrievedHalaqh.lastMessage, halaqh1.lastMessage);
  });

  test('set HalaqhData to Firestore failer ', () async {
    final firestore = FakeFirebaseFirestore();

    final halaqh1 = halaqh(
      mosqueName: 'Masjid Al-Rahman',
      halqahName: 'Quran Memorization',
      teacherName: 'Imam Omar',
      halaqhDays: 'MWF',
      halqahTime: '07:00 PM',
      teacheruid: '123456',
      senderId: '987654',
      groupId: 'abc123',
      lastMessage: '',
      membersUid: ['456789', '012345'],
      timeSent: DateTime.now(),
    );

    await firestore.collection('halaqh').add(halaqh1.toMap());

    final querySnapshot = await firestore.collection('halaqh').get();
    final documentSnapshot = querySnapshot.docs.first;
    final retrievedHalaqh = halaqh.fromMap(documentSnapshot.data());

    expect(retrievedHalaqh.mosqueName, retrievedHalaqh.teacherName);
  });

  test('set HalaqhData to Firestore fails to send data ', () async {
    final firestore = FakeFirebaseFirestore();

    final halaqh1 = halaqh(
      mosqueName: 'Masjid Al-Rahman',
      halqahName: 'Quran Memorization',
      teacherName: 'Imam Omar',
      halaqhDays: 'MWF',
      halqahTime: '07:00 PM',
      teacheruid: '123456',
      senderId: '987654',
      groupId: 'abc123',
      lastMessage: '',
      membersUid: ['456789', '012345'],
      timeSent: DateTime.now(),
    );
 

    final querySnapshot = await firestore.collection('halaqh').get();
  

    expect(querySnapshot.docs, isEmpty);
  });

}
