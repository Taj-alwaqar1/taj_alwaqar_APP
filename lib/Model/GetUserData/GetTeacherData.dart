import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class GetTeacherData extends GetxController{
  final teachersName = RxList<String>([]).obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<RxList<String>> getTeacherNames() async {
    try {
      // Check if user is authenticated
      final User? user = _auth.currentUser;
      if (user == null) {
        print('User is not authenticated.');
        return RxList<String>([]);
      }

      final QuerySnapshot teachersSnapshot =
          await _firestore.collection('users').get();

      for (final doc in teachersSnapshot.docs) {
        final userData = doc.data() as Map<String, dynamic>;

        if (userData['levelstd'] == "") {
          final String teacherName = userData['fristname'];
          teachersName.value.add(teacherName);
          print(teacherName);
          
        }
        else
        print("object");
      }

      return teachersName.value;
    } catch (e) {
      print('Error occurred: $e');
       return RxList<String>([]);
    }
  }
}