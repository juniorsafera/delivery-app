// ignore_for_file: prefer_is_empty, duplicate_ignore

import 'package:delivey_app/components/form_dados_cliente.dart';
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
        // ignore: prefer_is_empty
        child:
            // pedidos.length == 0
            //     ? SizedBox(
            //         width: size.width,
            //         height: size.height,
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: const [
            //             Text('Vazio'),
            //           ],
            //         ),
            //       )
            //     :
            Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: pedidos.length,
                itemBuilder: (context, index) {
                  final _pedido = pedidos[index];
                  final add = _pedido.adicionais.toList();
                  return Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '1x  ' '${_pedido.pedido.titulo}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text('R\$ ' +
                                        _pedido.valorTotalItem +
                                        ',00'),
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
                        add.length == 0
                            ? const Text('')
                            : SizedBox(
                                width: size.width,
                                height: 30,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: add.length,
                                    itemBuilder: (context, i) {
                                      final ads = add[i];
                                      return add.length == 0
                                          ? const Text('')
                                          : Text(ads.titulo + ' -');
                                    }),
                              ),
                        Text(
                          _pedido.observacao,
                          style: const TextStyle(color: Colors.red),
                        ),
                        const Divider(),
                      ],
                    ),
                  );
                }),
            ExpansionTile(
              title: const Center(child: Text('Finalizar Pedido')),
              children: [
                const FormDadosCliente(),
                FloatingActionButton.extended(
                  onPressed: () {},
                  label: const Text('Enviar Pedido'),
                  icon: const Icon(Icons.send),
                  backgroundColor: Paleta.corPrimaria,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
