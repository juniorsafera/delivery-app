import 'dart:math';

import 'package:delivey_app/provider/itens_pedido.dart';
import 'package:flutter/material.dart';
import 'package:delivey_app/components/botaoadd.dart';
import 'package:delivey_app/components/frame_add_carrinho.dart';
import 'package:delivey_app/models/item_cardapio.dart';
import 'package:delivey_app/models/pedido.dart';
import 'package:delivey_app/others/paleta_cores.dart';
import 'package:provider/provider.dart';

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

                    _item   
                     
                    
                    
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
