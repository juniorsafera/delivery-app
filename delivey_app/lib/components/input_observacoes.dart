import 'package:flutter/material.dart';

class InputObservacoes extends StatelessWidget {
  final TextEditingController textObservacao;
  const InputObservacoes({Key? key, required this.textObservacao})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: const Text(
                "Observações:",
                style: TextStyle(
                  fontSize: 16,
                ),
              )),

          // Definindo   input (Observações)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: textObservacao,
                    maxLines: 2,
                    decoration: const InputDecoration.collapsed(
                      hintText: " ",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
