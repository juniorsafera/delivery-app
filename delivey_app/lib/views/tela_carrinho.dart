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
          title: Text('Carrinho'),
        ),
        body: Container(
            child: Column(
          children: [
            Text('Pedidos:'),
            Container(
              width: size.width,
              height: 150,
              color: Colors.grey[200],
              child: ListView.builder(
                itemCount: pedidos.length,
                itemBuilder: (context, index){
                  final _pedido = pedidos[index];
                  return ListTile(
                    title: Text('1x ${_pedido.pedido.titulo}'),
                    subtitle: Text(_pedido.adicionais.toString()),
                    trailing: Text('R\$ ${_pedido.valorTotalItem},00'),
                  );
                }
                
                )
            ),
          ],
        )));
  }
}
