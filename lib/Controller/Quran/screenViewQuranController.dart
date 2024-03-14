// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/Quran/Quran.dart';


class SurahBuilderController extends GetxController {
  late RxInt sura = 0.obs;
  late List arabic;
  late RxString suraName = "".obs;
  late RxInt ayah = 0.obs;
  bool view = false;

  String arabicFont = 'quran';
  double arabicFontSize = 28;
  double mushafFontSize = 40;

//verseBuilder index
  RxInt indexxxx = 0.obs;
  int previousVerses = 0;

  //all the surah
  String fullSura = '';

  RxList quran = [].obs;

  late int LengthOfSura;

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
//index, controller.quran[0], surahName[index]['name'], 0
  getValue(surahhh, arabiccc, suraNameee, ayahhhh) {
    sura.value = surahhh;
    arabic = arabiccc;
    suraName.value = suraNameee;
    ayah.value = ayahhhh;

    LengthOfSura = noOfVerses[surahhh];
    print(sura);
    print("object");
    print(LengthOfSura);
    print(suraName.value);
    //send to another Screen!!!
    getpreviousVersesvalue();
    getSurahName();
  }





  Future readJson() async {
try {
      final String response = await rootBundle.loadString(
          "assets/json/Quran.json"); //here will get data from json file
      final data = json.decode(response); // to know response
      arabic =
          List.of(data["quran"]); // sorte data in list key value [aya_text]
      print('okkkkkkkk');
      return quran.value = [arabic];
    } catch (e) {
      print('erorr ' + e.toString());
    }
    
    }

  getpreviousVersesvalue() {
    if (sura.value + 1 != 1) {
      for (int i = sura.value - 1; i >= 0; i--) {
        previousVerses = previousVerses + noOfVerses[i];
      }

      print('====================');

      print(previousVerses);
      print('====================');
    } else
      previousVerses = 0;
  }

  getSurahName() {
    for (int i = 0; i < LengthOfSura; i++) {
      fullSura += (arabic[i + previousVerses]['aya_text']);
    }
    print(fullSura);
  }
  deletesurah(){
    LengthOfSura=0;
    previousVerses=0;
    fullSura='';
  }
}
