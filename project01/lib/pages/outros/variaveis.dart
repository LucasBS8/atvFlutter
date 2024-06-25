String nota = "Reflexão:"
    "\nA semana foi bastante produtiva, com a turma participativa e interessada nos conteúdos. A atividade prática foi um sucesso, e os alunos se mostraram engajados na resolução dos problemas. A prova foi um bom instrumento de avaliação, e os alunos que tiveram dificuldades receberam o apoio necessário para se recuperarem."
    "\n\nDesafios:"
    "\n\nAlguns alunos ainda apresentam dificuldades com alguns conteúdos. Será necessário continuar oferecendo apoio individualizado para que eles possam superar essas dificuldades."
    "\n\nPlanos para a próxima semana:"
    "\n\nDar continuidade ao estudo do tema em andamento."
    "\n\nPropor novas atividades desafiadoras para os alunos."
    "\n\nRealizar mais avaliações para acompanhar o progresso dos alunos."
    "\n\nObservações:"
    "\n\nAlguns alunos se destacaram pela sua participação e desempenho."
    "\n\nÉ importante manter um bom clima na sala de aula para que os alunos se sintam motivados a aprender."
    "\n\nA comunicação com os pais é fundaAmental para o sucesso do processo de aprendizagem.";

class Aluno {
  int id;
  String nome;
  bool isChecked;
  int numFalta;
  List<bool> faltas;

  Aluno(
      {required this.id,
      required this.nome,
      this.isChecked = false,
      required this.numFalta,
      required this.faltas});
}

int contaFaltas(List<bool> faltaLista) {
  int i = 0;
  for (var falta in faltaLista) {
    if (falta == false) {
      i++;
    }
  }
  return i;
}

List<Aluno> alunos = [
  Aluno(
      id: 1,
      nome: 'Alice',
      faltas: [true, false, false, true, true],
      numFalta: contaFaltas([true, false, false, true, true])),
  Aluno(
      id: 2,
      nome: 'Bob',
      faltas: [true, false, false, true, true],
      numFalta: contaFaltas([true, false, false, true, true])),
  Aluno(
      id: 3,
      nome: 'Charlie',
      faltas: [true, false, false, true, true],
      numFalta: contaFaltas([true, false, false, true, true])),
  Aluno(
      id: 4,
      nome: 'David',
      faltas: [true, false, false, true, true],
      numFalta: contaFaltas([true, false, false, true, true]))
];
