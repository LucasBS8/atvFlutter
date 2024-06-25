class Tarefa {
  final int? id;
  final int idUsuario;
  final String titulo;
  final String descricao;
  final String dataHora;
  final int finalizada;

  const Tarefa(
      {this.id,
      required this.idUsuario,
      required this.titulo,
      required this.descricao,
      required this.dataHora,
      required this.finalizada});

  factory Tarefa.fromJson(Map<String, dynamic> json) {
    return Tarefa(
      id: json['id'] ?? 0,
      idUsuario: json['idUsuario'] ?? 0,
      titulo: json['titulo'] ?? 'N/A',
      descricao: json['descricao'] ?? 'N/A',
      dataHora: json['dataHora'] ?? 'N/A',
      finalizada: json['finalizada'] ?? 0,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idUsuario': idUsuario,
      'titulo': titulo,
      'descricao': descricao,
      'dataHora': dataHora,
      'finalizada': finalizada,
    };
  }
}
