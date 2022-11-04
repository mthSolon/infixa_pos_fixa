import 'dart:io';

void main() {
  Lista pilha = Lista();
  print("Digite a expressão: ");
  String expressao = stdin.readLineSync() ?? '';
  List<String> splitStr = expressao.split('');

  for (int i = 0; i < splitStr.length; i++) {
    if (isNumeric(splitStr[i])) {
      stdout.write("${splitStr[i]}");
  	}else if (splitStr[i] == ' '){
			continue;
		} else if (splitStr[i] == '(') {
      	pilha.push(splitStr[i]);
    } else if (splitStr[i] == ')') {
      	var x = pilha.pop();
      	while (pilha.lista.length != 0 && x != '(') {
        	stdout.write("${x}");
        	x = pilha.pop();
      }
    } else {
      	while (pilha.lista.length != 0 &&
          prioridade(pilha.lista[pilha.lista.length - 1]) >=
          prioridade(splitStr[i])) {
        		stdout.write("${pilha.pop()}");
      }
      	pilha.push(splitStr[i]);
    }
  }
  while (pilha.lista.length != 0) {
    stdout.write("${pilha.pop()}");
  }
}

int prioridade(var x) {
  if (x == "(") {
    return 0;
  }
  if (x == "+" || x == "-") {
    return 1;
  }
  if (x == "*" || x == "/") {
    return 2;
  }
  return 0;
}

// Verificar números
bool isNumeric(String s) {
  if (s.isEmpty) {
    return false;
  }

  final number = num.tryParse(s);
  if (number == null) {
    return false;
  }
  return true;
}

class Lista {
  var lista;

  Lista() {
    this.lista = [];
  }

  //funçao push
  void push(var add) {
    this.lista = this.lista + [add];
  }

  //função pop
  pop() {
    var temp = this.lista;
    var retorno = this.lista[lista.length - 1];
    this.lista = [];
    for (int i = 0; i < temp.length - 1; i++) {
      this.lista = this.lista + [temp[i]];
    }
    return retorno;
  }
}
