import 'package:delivey_app/models/carrinho.dart';
import 'package:delivey_app/models/pedido.dart';

const List<ModelCarrinho> DADOS_CARRINHO = [
  ModelCarrinho(
      codigo: '001',
      nomeCliente: 'Leticia Silva',
      pedidos: [
        ModelPedido(
            codigo: 'p1',
            pedido: 'X-BURGUER',
            adicionais: ['Calabresa', 'Baicon'],
            valorTotalItem: '16,00')
      ],
      tipoPagamento: 'cartao',
      troco: false,
      entrega: false,
      endereco: 'Rua leste',
      numero: '55',
      bairro: 'Planalto',
      contato: '888888888',
      observacao: '',
      valorTotalCarrinho: '')
];
