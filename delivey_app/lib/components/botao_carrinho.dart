import 'package:flutter/material.dart';
import 'package:delivey_app/others/paleta_cores.dart';

class BotaoCarrinho extends StatefulWidget {
  final String numeroPedidos;
  const BotaoCarrinho({
    Key? key,
    required this.numeroPedidos,
  }) : super(key: key);

  @override
  State<BotaoCarrinho> createState() => _BotaoCarrinhoState();
}


class _BotaoCarrinhoState extends State<BotaoCarrinho> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
           Container(child: Icon(Icons.delivery_dining_outlined)),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Paleta.corPrimaria,
              ),
              child: Center(
                child: Text(
                  widget.numeroPedidos,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
