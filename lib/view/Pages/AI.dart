import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frist_file_taj_alwaqar/Controller/Login&signincontroller/loginController.dart';
import 'package:frist_file_taj_alwaqar/view/Shared/Color.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:speech_to_text/speech_to_text.dart';

// class AI extends StatelessWidget {
//   const AI({super.key});

//   @override
//   Widget build(BuildContext context) {
    
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("AI"),
//       ),
//     );
//   }
// }


class AI extends StatefulWidget {
  const AI({super.key});

  @override
  State<AI> createState() => _AIState();
}

class _AIState extends State<AI> {
//   //_speechToText is the object that used for take user words
  final SpeechToText _speechToText = SpeechToText();
//for check that every thing is good responseible about  _speechToText.initialize()
  bool _speechEnabled = false;
  //take user words
  String _wordsSpoken = "";
  //not need for check the accurase of pronsution
  double _confidenceLevel = 0;
//1
  @override
  void initState() {
    super.initState();
    initSpeech();
  }

//2
  void initSpeech() async {
    //_speechToText.initialize() return true or false that check the  audio capture, loading necessary resources, and checking for compatibility with the device.
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

//when press icon mic to start
  void _startListening() async {
    await _speechToText.listen(
        //_onSpeechResult the text that user said
        //onResult: (result) => _onSpeechResult(result),
        onResult: _onSpeechResult,
        localeId: 'ar');
    setState(() {
      _confidenceLevel = 0;
    });
  }

  void _stopListening() async {
    //end the Listening
    await _speechToText.stop();
    // compareTextByWord(_wordsSpoken);
    setState(() {});
  }

//here insert text into var _wordsSpoken
  void _onSpeechResult(result) {
    setState(() {
      _wordsSpoken = "${result.recognizedWords}";
    });
  }

  // Text you want to compare with (replace with your actual text)
  String comparisonText =
      "بسم الله الرحمن الرحيم الحمد لله رب العالمين الرحمن الرحيم مالك يوم الدين إياك نعبد وإياك نستعين اهدنا الصراط المستقيم صراط الذين أنعمت عليهم غير المغضوب عليهم ولا الضالين";

  // Split the strings into word lists

  @override
  Widget build(BuildContext context) {
    List<String> words1 = _wordsSpoken.split(' ');
    List<String> words2 = comparisonText.split(' ');

    int shorterLength =
        words1.length < words2.length ? words1.length : words2.length;

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
            style: TextStyle(
              color: yallowTextColor,
              fontSize: 30
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                // padding: EdgeInsets.all(16),
                child: Text(
                  _speechToText.isListening
                      //here aqra will display
                      ? "يتسمع ...." 
                      // _speechEnabled = true if _speechToText.initialize return true for this if evry thing is good and ready for listing
                      : _speechEnabled
                          ? "انقر لبدء التسميع ....."
                          : "Speech not available",
                  style: TextStyle(fontSize: 26.0,color: yallowTextColor),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child:  Wrap(
                      textDirection: TextDirection.rtl,
                      children: [
                        if (_wordsSpoken.isNotEmpty)
                          for (int i = 0; i < shorterLength; i++)
                            compareTextByWord(_wordsSpoken, shorterLength, i),
                  
                      ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          //bool _listening = false; at start is _stopListening then will be _startListening
          onPressed: _speechToText.isListening ? _stopListening : _startListening,
          tooltip: 'Listen',
          child: Icon(
            _speechToText.isNotListening ? Icons.mic_off : Icons.mic,
            color: Colors.white,
          ),
          backgroundColor: darkGreen,
        ),
      ),
    );
  }

  Container compareTextByWord(String recognizedText, shorterLength, i) {
    List<String> words1 = recognizedText.split(' ');
    List<String> words2 = comparisonText.split(' ');

    String word1 = words1[i].toLowerCase();
    String word2 = words2[i].toLowerCase();

    if (word1.compareTo(word2) == 0) {
      print("Word ${i + 1} matches: $word1");
      return Container(
        // padding: EdgeInsets.all(16),
        child: Text(
          word1 + ' ',
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w300,
            color: Colors.green,
          ),
          textDirection: TextDirection.rtl,
        ),
      );
    } else {
      print("Word ${i + 1} differs: $word1 != $word2 (red)");
      return Container(
        // padding: EdgeInsets.all(16),
        child: Text(
          word1 + ' ',
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w300,
            color: Colors.red,
          ),
          textDirection: TextDirection.rtl,
        ),
      );
    }
  }
}
