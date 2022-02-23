import 'dart:math';

import 'package:flutter/material.dart';
import 'package:delivey_app/components/botaoadd.dart';
import 'package:delivey_app/components/frame_add_carrinho.dart';
import 'package:delivey_app/models/item_cardapio.dart';
import 'package:delivey_app/models/pedido.dart';
import 'package:delivey_app/others/paleta_cores.dart';

class ListaItemCardapio extends StatefulWidget {
  final List<ModelItemCardapio> itens;
  const ListaItemCardapio({
    Key? key,
    required this.itens,
  }) : super(key: key);

  @override
  State<ListaItemCardapio> createState() => _ListaItemCardapioState();
}

class _ListaItemCardapioState extends State<ListaItemCardapio> {
  static List<ModelPedido> _Pedidos = [];

  List<ModelPedido> get _pedidosRecentes {
    return _Pedidos.toList();
  }

  _adicionarPedido(String pedido, List<String> adicionais, String valor) {
    final novoPedido = ModelPedido(
        codigo: Random().nextDouble().toString(),
        pedido: pedido,
        adicionais: adicionais,
        valorTotalItem: valor);

    setState(() {
      _Pedidos.add(novoPedido);
    });
  }

  @override
  Widget build(BuildContext context) {
    final FrameAddCarrinho frame = FrameAddCarrinho();
    return Expanded(
      child: ListView.builder(
        itemCount: widget.itens.length,
        itemBuilder: (context, index) {
          final _item = widget.itens[index];
          return Column(
            children: [
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => frame.FrameAddItem(
                    context,
                    _item.titulo,
                    _item.valor,
                    _adicionarPedido
                  ),
                  child: ListTile(
                    title: Text(
                      _item.titulo,
                      style: const TextStyle(
                        color: Paleta.corPrimaria,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      _item.itens
                          .toString()
                          .replaceAll('[', '')
                          .replaceAll(']', ''),
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    trailing: BotaoAdd(valor: _item.valor),
                  ),
                ),
              ),
              const Divider(),
            ],
          );
        },
      ),
    );
  }
}
