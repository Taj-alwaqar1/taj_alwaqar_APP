// ignore_for_file: prefer_const_declarations

import 'package:flutter_test/flutter_test.dart';
import 'package:frist_file_taj_alwaqar/Controller/pagesController/SaveSyllaubsDataControler.dart';
import 'package:mockito/mockito.dart';

void main() {
test('addMembertoSyllabus adds SyllabusInfo objects to Syllabus', () {
   
   final syllabus =[];
   final createSylaubsController = CreateSylaubsController();

  final syllabusDays1 = 'Day 1';
  final nameOfSurah1 = 'Surah An-Naba';
  final startVerse1 = '1';
  final endVerse1 = '10';

  final syllabusDays2 = 'Day 2';
  final nameOfSurah2 = "Surah Al-Baqarah";
  final startVerse2 = '20';
  final endVerse2 = '30';

 syllabus.add(SyllabusInfo(SyllabusDays: syllabusDays1, nameOfSurah: nameOfSurah1, StartVerse:int.parse( startVerse1), EndVerse: int.parse(endVerse1)));
 syllabus.add(SyllabusInfo(SyllabusDays: syllabusDays2, nameOfSurah: nameOfSurah2, StartVerse:int.parse( startVerse2), EndVerse: int.parse(endVerse2)));

 
  createSylaubsController.addMembertoSyllabustest(syllabus);

 
  expect(createSylaubsController.Syllabustest.length, 2);  

  final syllabus1 = createSylaubsController.Syllabustest[0];
  final syllabus2 = createSylaubsController.Syllabustest[1];

  expect(syllabus1.SyllabusDays, syllabusDays1);
  expect(syllabus1.nameOfSurah, nameOfSurah1);
  expect(syllabus1.StartVerse, int.parse(startVerse1));
  expect(syllabus1.EndVerse, int.parse(endVerse1));

  expect(syllabus2.SyllabusDays, syllabusDays2);
  expect(syllabus2.nameOfSurah, nameOfSurah2);
  expect(syllabus2.StartVerse, int.parse(startVerse2));
  expect(syllabus2.EndVerse, int.parse(endVerse2));
});

}
