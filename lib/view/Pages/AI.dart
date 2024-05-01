// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/Controller/Login&signincontroller/loginController.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/Color.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../Controller/pagesController/AiController.dart';

class AI extends StatefulWidget {
  @override
  State<AI> createState() => _AIState();
}

class _AIState extends State<AI> {
  final AiController controller = Get.put(AiController());

  @override
  void initState() {
    super.initState();
    controller.initSpeech();
  }
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.userWord.value='';
  }
  void initSpeech() async {
    //speechToText.initialize() return true or false that check the  audio capture, loading necessary resources, and checking for compatibility with the device.
    controller.initSpeech();
    setState(() {});
  }

  void startListening() async {
    await controller.speechToText.listen(
        //_onSpeechResult the text that user said
        //onResult: (result) => _onSpeechResult(result),
        onResult: onSpeechResult,
        localeId: 'ar');
    controller.myIsListening.value = true;
    setState(() {});
  }

  void stopListening() async {
    //end the Listening
    controller.stopListening();
    // compareTextByWord(_userWord);
    setState(() {});
  }

  //here insert text into var _userWord
  void onSpeechResult(result) {
    setState(() {
      controller.userWord.value = result.recognizedWords;
    });
  }

  @override
  Widget build(BuildContext context) {
    controller.words1.value = controller.userWord.split(' ');
    controller.words2.value = controller.comparisonText.split(' ');

    controller.shorterLength.value =
        controller.words1.length < controller.words2.length
            ? controller.words1.length
            : controller.words2.length;

    return Container(
        decoration: BoxDecoration(
          gradient: GradientGreen,
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: darkGreen,
            title: Text(
              'AI',
              style: TextStyle(color: yallowTextColor, fontSize: 33),
            ),
          ),
          body: Center(
            child: Column(
              children: [
                Container(
                  // padding: EdgeInsets.all(16),
                  child: Obx(
                    () => Text(
                      controller.myIsListening.value
                          ? 'استماع ...'
                          : controller.speechEnabled.value
                              ? 'انقر لبدء الاستماع ...'
                              : 'غير متاح ',
                      style: TextStyle(fontSize: 20.0,color: yallowTextColor),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Wrap(
                      textDirection: TextDirection.rtl,
                      children: [
                        if (controller.userWord.value.isNotEmpty)
                          for (int i = 0;
                              i < controller.shorterLength.value;
                              i++)
                            compareTextByWord(controller.userWord.value, i),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: Obx(
            () => FloatingActionButton(
              onPressed: controller.myIsListening.value
                  ? stopListening
                  : startListening,
              tooltip: 'Listen',
              child: Icon(
                controller.myIsListening.value ? Icons.mic_off : Icons.mic,
                color: Colors.white,
              ),
              backgroundColor: darkGreen,
            ),
          ),
        ));
  }
}

Widget compareTextByWord(String recognizedText, i) {
  // print(i);
  final AiController controller = Get.put(AiController());

  // print('xxxxxxxxxsssssssssssss');
  // controller.words1.value = recognizedText.split(' ');
  // controller.words2.value = controller.comparisonText.split(' ');

  String word1 = controller.words1.value[i];
  String word2 = controller.words2.value[i];

  if (word1.compareTo(word2) == 0) {
    print("Word ${i + 1} matches: $word1");
    controller.update();

    return Text(
      word1 + ' ',
      style: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w300,
        color: Colors.green,
      ),
      textDirection: TextDirection.rtl,
    );
  } else {
    print("Word ${i + 1} differs: $word1 != $word2 (red)");
    controller.update();

    return Text(
      word1 + ' ',
      style: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w300,
        color: Colors.red,
      ),
      textDirection: TextDirection.rtl,
    );
  }
}
