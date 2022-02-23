import 'package:delivey_app/models/pedido.dart';

class ModelCarrinho {
  final String codigo;
  final String nomeCliente;
  final List<ModelPedido> pedidos;
  final String tipoPagamento;
  final bool troco;
  final bool entrega;
  final String endereco;
  final String numero;
  final String bairro;
  final String contato;
  final String observacao;
  final  String valorEntrega;
  final String valorTotalCarrinho;

  const ModelCarrinho({
    required this.codigo,
    required this.nomeCliente,
    required this.pedidos,
    required this.tipoPagamento,
    required this.troco,
    required this.entrega,
    required this.endereco,
    required this.numero,
    required this.bairro,
    required this.contato,
    required this.observacao,
      this.valorEntrega = '5,00',
    required this.valorTotalCarrinho
  });
}
