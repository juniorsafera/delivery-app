
class ModelItemCardapio {
  final String codigo;
  final String titulo;
  final List<String> itens;
  final List<String> categorias;
  final String valor;
  bool disponivel;

  ModelItemCardapio({
    required this.codigo,
    required this.titulo,
    required this.itens,
    required this.categorias,
    required this.valor,
    this.disponivel = true,
  });

  void alterarDisponivel() {
    disponivel = !disponivel;
  }
}
