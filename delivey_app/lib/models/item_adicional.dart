class ModelItemAdicional {
  final String codigo;
  final String titulo;
  final String valor;
  final bool disponivel;

  const ModelItemAdicional({
    required this.codigo,
    required this.titulo,
    required this.valor,
    this.disponivel = true,
  });
}
