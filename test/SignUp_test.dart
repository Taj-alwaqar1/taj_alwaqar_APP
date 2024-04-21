import 'package:flutter_test/flutter_test.dart';
import 'package:frist_file_taj_alwaqar/Controller/Login&signincontroller/SigninController.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

void main() {
  final SigninController controller = Get.put(SigninController());
  test('empty userName test', () {
    String? result = controller.ValidateUserNameFeild('');
    expect(result, 'Enter correct username');
  });
  test('valid userName test', () {
    String? result = controller.ValidateUserNameFeild('saleh_alzayed');
    expect(result, ' username is valid');
  });
  test('empty email test', () {
    String? result = controller.validateEmail('');
    expect(result, 'Provide valid Email');
  });
  test('valid email test', () {
    String? result = controller.validateEmail('sa@gmail.com');
    expect(result, ' Email is valid');
  });
  test('empty age test', () {
    String? result = controller.ValidateAgeFeild('');
    expect(result, 'Enter correct age');
  });
  test('valid age test', () {
    String? result = controller.ValidateAgeFeild('20');
    expect(result, 'age is valid');
  });
  test('empty number test', () {
    String? result = controller.ValidateNumFeild('');
    expect(result, 'Enter correct number');
  });
  test('valid number test', () {
    String? result = controller.ValidateNumFeild('0594647741');
    expect(result, 'number is valid');
  });
  test('empty first or last name test', () {
    String? result = controller.ValidateTexfFeild('');
    expect(result, 'Enter correct Name');
  });
  test('valid first or last name test', () {
    String? result = controller.ValidateTexfFeild('saleh');
    expect(result, 'Name is valid');
  });
  test('empty Password test', () {
    String? result = controller.validatePassword('');
    expect(result, 'Password must be of 8 characters');
  });
  test('valid Password test', () {
    String? result = controller.validatePassword('1qazxsw21');
    expect(result, 'Password is valid');
  });
}
