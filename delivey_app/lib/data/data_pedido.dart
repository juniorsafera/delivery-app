import 'dart:math';

import 'package:delivey_app/models/pedido.dart';
import 'package:delivey_app/views/tela_carrinho.dart';

class DadosPedido{
    final List<ModelPedido> dadosPedidos = [];

    void adicionarPedido(String pedido, List<String> adicionais, String valorTotalItem){
          dadosPedidos.add(
            ModelPedido(codigo: Random().nextDouble().toString(),
            pedido: pedido, 
            adicionais: adicionais, 
            valorTotalItem: valorTotalItem),
            );
            print(dadosPedidos[0].pedido);
            final TelaCarrinho dca = TelaCarrinho();
            
             
    }
}
