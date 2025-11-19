// lib/logic/calculator_logic.dart
class CalculatorLogic {
  String output = "0";
  double num1 = 0;
  double num2 = 0;
  String operand = "";

  void buttonPressed(String buttonText) {
    if (buttonText == "C") {
      output = "0"; num1 = 0; num2 = 0; operand = "";
    }
    else if (buttonText == "+/-") {
      if (output != "0" && output != "Error") {
        output = output.startsWith("-") ? output.substring(1) : "-$output";
      }
    }
    else if (buttonText == "%") {
      final value = double.tryParse(output) ?? 0;
      output = (value / 100).toString();
    }
    else if (["+", "-", "×", "÷"].contains(buttonText)) {
      num1 = double.tryParse(output) ?? 0;
      operand = buttonText;
      output = "0";
    }
    else if (buttonText == "=") {
      num2 = double.tryParse(output) ?? 0;
      if (operand.isEmpty) return;
      switch (operand) {
        case "+": output = (num1 + num2).toString(); break;
        case "-": output = (num1 - num2).toString(); break;
        case "×": output = (num1 * num2).toString(); break;
        case "÷": output = num2 != 0 ? (num1 / num2).toString() : "Error"; break;
      }
      operand = ""; num1 = 0; num2 = 0;
    }
    else {
      if (output == "0" || output == "Error") output = buttonText;
      else output += buttonText;
    }

    // Fix .0 thừa an toàn tuyệt đối
    final parsed = double.tryParse(output);
    if (parsed != null) {
      output = parsed == parsed.truncate() 
          ? parsed.truncate().toString()
          : parsed.toString().replaceFirst(RegExp(r'0+$'), '').replaceFirst(RegExp(r'\.$'), '');
    }
    if (output == "." || output == "-." || output.isEmpty) output = "0";
  }
}