import 'dart:io'; // Importa biblioteca para entrada e saída
import 'livro.dart'; // Importa a classe Livro

// Lista global ("banco de dados")
List<Livro> biblioteca = [];
// Contador para gerar IDs automáticos, garantindo livros únicos
int proximoId = 1;

void main() {
  int? opcao; // Pode ser inteiro ou nula (?)

  // Loop com as opções até que a opção 5 (Sair) seja escolhida
  do {
    print('\n--- Sistema de Biblioteca ---');
    print('1 - Cadastrar livro');
    print('2 - Listar livros');
    print('3 - Atualizar livro');
    print('4 - Remover livro');
    print('5 - Sair');
    stdout.write('Escolha uma opção: '); // Escreva na mesma linha, não pula

    // Lê a linha do teclado. Se for nula, usa string vazia ('')
    // O tryParse tenta converter para número se o usuário digitar letra
    opcao = int.tryParse(stdin.readLineSync() ?? '');

    // Estrutura para chamar função baseada na opção
    switch (opcao) {
      case 1: cadastrar(); break;
      case 2: listar(); break;
      case 3: atualizar(); break;
      case 4: remover(); break;
      case 5: print('Saindo...'); break;
      default: print('Opção inválida! Tente novamente.');
    }
  } while (opcao != 5);
}

// Função que cria um novo objeto Livro e adiciona na Lista
void cadastrar() {
  stdout.write('Título: ');
  String titulo = stdin.readLineSync()!; // '!' garante que o valor não é nulo

  stdout.write('Autor: ');
  String autor = stdin.readLineSync()!;

  stdout.write('Ano: ');
  // Converte a entrada de texto para número inteiro
  int ano = int.parse(stdin.readLineSync()!);

  // Adiciona o livro na lista usando ID atual e depois incrementa o ID para o próximo
  biblioteca.add(Livro(proximoId++, titulo, autor, ano));
  print('Livro cadastrado com sucesso!');
}

// Função para exibir todos os livros na lista
void listar() {
  if (biblioteca.isEmpty) {
    print('Nenhum livro cadastrado no sistema.');
  } else {
    // Percorre a lista e executa o print para cada livro (l) encontrado
    biblioteca.forEach((l) => print(l));
  }
}

// Função para buscar um livro pela ID e alterar o título
void atualizar() {
  stdout.write('Digite o ID do livro par atualizar: ');
  int id = int.parse(stdin.readLineSync()!);

  try {
    // Busca o primerio livro onde o ID coincide. Se não achar, lança um erro.
    var livro = biblioteca.firstWhere((l) => l.id == id);

    stdout.write('Novo Título (atual: ${livro.titulo}): ');
    livro.titulo = stdin.readLineSync()!;
    print('Livro atualizado com sucesso!');
  } catch (e) {
    // Captura o erro caso o ID não exista na lista
    print('Livro não encontrado.');
  }
}

// Função para deletar um livro da lista pelo ID
void remover() {
  stdout.write('Digite o ID do livro para remover: ');
  int id = int.parse(stdin.readLineSync()!);

  // Salva o tamanho atual da lista para comparar depois
  int tamanhoInicial = biblioteca.length;

  // Remove todos os itens que possuem o ID informado
  biblioteca.removeWhere((l) => l.id == id);

  // Se o tamanho da lista diminuiu, a remoção foi completa
  if (biblioteca.length < tamanhoInicial) {
    print('Livro removido com sucesso!');
  } else {
    print('ID não encontrado. Nada foi removido.');
  }
}