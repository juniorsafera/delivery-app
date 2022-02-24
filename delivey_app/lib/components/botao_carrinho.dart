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
      children:  [
        const Icon(
          Icons.delivery_dining_outlined,
          color: Colors.black,
          size: 45,
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
              width: 18,
              height: 18,
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
                  textAlign: TextAlign.center,
                ),
              )),
        ),
      ],
    );
  }
}
