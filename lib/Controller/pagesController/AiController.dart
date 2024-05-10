import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';

class AiController extends GetxController {
  final SpeechToText speechToText = SpeechToText();
  //for check that every thing is good responseible about  speechToText.initialize()
  RxBool speechEnabled = false.obs;
  RxBool myIsListening = false.obs;
  //take user words
  RxString userWord = "".obs;

  String comparisonText =
      "بسم الله الرحمن الرحيم الحمد لله رب العالمين الرحمن الرحيم مالك يوم الدين إياك نعبد وإياك نستعين اهدنا الصراط المستقيم صراط الذين أنعمت عليهم غير المغضوب عليهم ولا الضالين";

  RxList<String> words1 = <String>[].obs;
  RxList<String> words2 = <String>[].obs;

  //  int shorterLength =

  RxInt shorterLength = 0.obs;
// shorterLength.value = words1.length < words2.length ? words1.length : words2.length;
  //1
  @override
  void onReady() {
    super.onReady();
    initSpeech();
  }
  @override void onClose() {
    // TODO: implement onClose
    super.onClose();
    userWord.value='';
  }

  //2
  void initSpeech() async {
    //speechToText.initialize() return true or false that check the  audio capture, loading necessary resources, and checking for compatibility with the device.
    //obx to _speechEnabled
    speechEnabled.value = await speechToText.initialize();
    update();
  }

 
  void stopListening() async {
    await speechToText.stop();
    myIsListening.value = false;
    update();
  }
 
 



}

