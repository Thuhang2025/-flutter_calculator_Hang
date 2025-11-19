// lib/main.dart
import 'package:flutter/material.dart';
import 'logic/calculator_logic.dart';
import 'widgets/calculator_button.dart';

void main() => runApp(const CalculatorApp());

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});
  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  final CalculatorLogic logic = CalculatorLogic();

  // MÀU CHUẨN THEO ẢNH
  static const Color bgColor       = Color(0xFF1E1E1E);     // đen sâu
  static const Color numColor      = Color(0xFF333333);     // xám số
  static const Color clearColor    = Color(0xFFA6A6A6);     // C xám nhạt (như iPhone)
  static const Color operatorColor = Color(0xFF8FBC8F);     // xanh lá toán tử
  static const Color equalsColor   = Color(0xFF4CAF50);     // xanh lá đậm cho =

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
          child: Column(
            children: [
              // Màn hình kết quả
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.only(right: 30, bottom: 30),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    logic.output,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 80,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ),

              // Các nút
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      row(["C", "()", "%", "÷"], [const Color.fromARGB(255, 206, 14, 14), numColor, numColor, operatorColor]),
                      row(["7", "8", "9", "×"], [numColor, numColor, numColor, operatorColor]),
                      row(["4", "5", "6", "−"], [numColor, numColor, numColor, operatorColor]),
                      row(["1", "2", "3", "+"], [numColor, numColor, numColor, operatorColor]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalculatorButton(text: "+/-", backgroundColor: numColor, onTap: () => press("+/-")),
                          CalculatorButton(text: "0", backgroundColor: numColor, onTap: () => press("0")),
                          CalculatorButton(text: ".", backgroundColor: numColor, onTap: () => press(".")),
                          CalculatorButton(text: "=", backgroundColor: equalsColor, onTap: () => press("=")),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget row(List<String> texts, List<Color> colors) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(4, (i) => CalculatorButton(
          text: texts[i],
          backgroundColor: colors[i],
          onTap: () => press(texts[i]),
        )),
      ),
    );
  }

  void press(String value) => setState(() => logic.buttonPressed(value));
}