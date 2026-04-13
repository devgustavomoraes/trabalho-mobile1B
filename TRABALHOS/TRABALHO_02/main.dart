/// Trabalho 2 - Programação para Dispositivos Móveis
/// Aluno: Ronaldo Dranski Ra.: 24235222-2

import 'dart:io';

class Livro {
  String id;
  String titulo;
  String autor;
  int ano;

  Livro(this.id, this.titulo, this.autor, this.ano);

  @override
  String toString() => 'ID: $id | Título: $titulo | Autor: $autor | Ano: $ano';
}

void main() {
  List<Livro> biblioteca = [];
  String? opcao;

  do {
    print('\n1 - Cadastrar livro\n2 - Listar livros\n3 - Atualizar livro\n4 - Remover livro\n5 - Sair');
    stdout.write('Escolha: ');
    opcao = stdin.readLineSync();

    switch (opcao) {
      case '1':
        stdout.write('ID: '); String id = stdin.readLineSync()!;
        stdout.write('Título: '); String t = stdin.readLineSync()!;
        stdout.write('Autor: '); String a = stdin.readLineSync()!;
        stdout.write('Ano: '); int ano = int.parse(stdin.readLineSync()!);
        biblioteca.add(Livro(id, t, a, ano));
        break;
      case '2':
        if (biblioteca.isEmpty) print('Vazia.');
        else biblioteca.forEach(print);
        break;
      case '3':
        stdout.write('ID do livro para atualizar: ');
        String idBusca = stdin.readLineSync()!;
        var livro = biblioteca.firstWhere((l) => l.id == idBusca);
        stdout.write('Novo Título: '); livro.titulo = stdin.readLineSync()!;
        break;
      case '4':
        stdout.write('ID para remover: ');
        String idRemover = stdin.readLineSync()!;
        biblioteca.removeWhere((l) => l.id == idRemover);
        print('Removido.');
        break;
    }
  } while (opcao != '5');
}
