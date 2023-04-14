
class Pessoa{
  String nome;
  int idade;
  bool estaAutenticada;

  Pessoa(this.nome, this.idade, this.estaAutenticada);

  Map<String,dynamic> toMap(){
    return {
      'Nome': this.nome,
      'Idade': this.idade,
      'EstaAutenticada': this.estaAutenticada
    };
  } 
}