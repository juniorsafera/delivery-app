import 'package:delivey_app/components/trailing_item_carrinho.dart';
import 'package:delivey_app/others/paleta_cores.dart';
import 'package:delivey_app/provider/itens_pedido.dart';
import 'package:flutter/material.dart';
import 'package:delivey_app/models/pedido.dart';
import 'package:provider/provider.dart';

class TelaCarrinho extends StatefulWidget {
  const TelaCarrinho({Key? key}) : super(key: key);

  @override
  State<TelaCarrinho> createState() => _TelaCarrinhoState();
}

class _TelaCarrinhoState extends State<TelaCarrinho> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final providerPedidos = Provider.of<ListaPedidosProvider>(context);
    final List<ModelPedido> pedidos = providerPedidos.itensPedido;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Carrinho'),
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
              child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: pedidos.length,
                  itemBuilder: (context, index) {
                    final _pedido = pedidos[index];
                    return
                        /* ListTile(
                    title: Text('1x ${_pedido.pedido.titulo}'),
                    subtitle: Text('Adicionais: ${_pedido.adicionais.toString().replaceAll('[', ' ').replaceAll(']', ' ')}'),
                    trailing: TrailingItemCarrinho(valorItem: _pedido.valorTotalItem)          
                  ); */
                        Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    '1x  ' '${_pedido.pedido.titulo}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                
                                Text(_pedido.adicionais.first.titulo ),
                              
                              
                               Text(
                                    _pedido.observacao,
                                    style: TextStyle(color: Colors.red),
                                  ),
                                 
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text('R\$ 00,00'),
                                      IconButton(
                                          onPressed: () {
                                            providerPedidos
                                                .removerItemPedido(_pedido);
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ))
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          const Divider(),
                        ],
                      ),
                    );
                  }),
              const Text('Digite seu nome'),
              FloatingActionButton.extended(
                onPressed: () {},
                label: const Text('Enviar Pedido'),
                icon: const Icon(Icons.send),
                backgroundColor: Paleta.corPrimaria,
              )
            ],
          )),
        ));
  }
}
