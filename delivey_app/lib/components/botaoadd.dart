import 'package:flutter/material.dart';
import 'package:delivey_app/others/paleta_cores.dart';

class BotaoAdd extends StatelessWidget {
  final String valor;
  const BotaoAdd({
    Key? key,
    required this.valor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: 130,
      height: 40,
      child: Row(
        children: [
          Container(
              decoration: const BoxDecoration(
                color: Paleta.corPrimaria,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(0),
                ),
              ),
              width: 80,
              height: 40,
              child: Stack(
                children: [
                  const Positioned(
                      top: 3,
                      left: 12,
                      child: Text(
                        'R\$',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold),
                      )),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                      valor,
                      style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                    ),
                        )),
                  ),
                ],
              )),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(25),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(25),
              ),
            ),
            width: 50,
            height: 40,
            child: const Center(
                child: Text(
              '+add',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ),
        ],
      ),
    );
  }
}
