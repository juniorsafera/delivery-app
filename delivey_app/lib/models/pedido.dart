import 'package:delivey_app/models/item_cardapio.dart';

class ModelPedido {
  final String codigo;
  final ModelItemCardapio pedido;
  final List<String> adicionais;
  final String observacao;
  final String valorTotalItem;

  const ModelPedido({
    required this.codigo,
    required this.pedido,
    required this.adicionais,
    required this.observacao,
    required this.valorTotalItem,
  });
}
