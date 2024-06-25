class Usuario {
  final int? id;
  final String nome;
  final String email;
  final String senha;

  Usuario(
      {this.id,
      required this.nome,
      required this.email,
      required this.senha});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'] ?? 'default_id',
      nome: json['nome'] ?? 'N/A',
      email: json['email'] ?? 'N/A',
      senha: json['senha'] ?? 'N/A',
    );
  }
Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'senha': senha,
    };
}
}