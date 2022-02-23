class ModelPedido {
  final String codigo;
  final String pedido;
  final List<String> adicionais;
  final String valorTotalItem;

  const ModelPedido({
    required this.codigo,
    required this.pedido,
    required this.adicionais,
    required this.valorTotalItem,
  });
}
