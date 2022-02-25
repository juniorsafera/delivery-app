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
        Container(
          padding: EdgeInsets.all(10),
          child: const Icon(
            Icons.shopping_cart_outlined,
            color: Colors.black,
            size: 35,
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
              width: 20,
              height: 20,
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
