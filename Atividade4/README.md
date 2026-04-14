## Trabalho 4 - Aplicação de Lista de Tarefas com Gestão de Estado

### Descrição da Aplicação

Um aplicativo de lista de tarefas (To-Do List) funcional em Flutter que permite criar, visualizar, marcar como concluídas e remover tarefas.

### Implementação da Gestão de Estado

A aplicação utiliza o pacote Riverpod para gerenciar os estados.

  * Um StateNotifierProvider (ou similar) foi utilizado para gerenciar o estado da lista de tarefas.
  * Ele garante que a interface do ListView.builder seja atualizada em tempo real sempre que uma tarefa for adicionada, removida ou alterada visualmente como concluída.

### Instruções para Execução

1.  Certifique-se de ter o Flutter configurado.
2.  Acesse a pasta do trabalho 4 no terminal.
3.  Garanta que as dependências do Riverpod estejam baixadas rodando `flutter pub get`.
4.  Execute o comando:
    ```bash
    flutter run
    ```
