import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetData {
  final List<QueryDocumentSnapshot> StdData = [];
  
late String username;
getStudentsData() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final docID = user.uid;
        final querySnapshot = await FirebaseFirestore.instance
            .collection('students')
            .where('userId', isEqualTo: docID)
            .get();
        StdData.addAll(querySnapshot.docs);
      } else {
        // Handle the case where there's no logged-in user
      }
    } catch (error) {
      print("Error fetching data: $error");
    }
  }

 getUsername() async {
    try {
        final user = FirebaseAuth.instance.currentUser;
       final docID = user!.uid;
      if (user != null) {
        final docSnapshot = await FirebaseFirestore.instance
            .collection("students")
            .doc(docID)
            .get();
        return username= docSnapshot['username'];
      } else {
        return "User not found";
      }
    } catch (error) {
      print("Error fetching username: $error");
      return username= "Error fetching username";
    }
  }
}