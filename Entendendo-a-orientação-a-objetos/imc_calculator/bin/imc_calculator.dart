import 'dart:io';

void main() {
  print("Digite seu nome");
  String? nameInput = stdin.readLineSync();
  print("Digite sua idade");
  String? ageInput = stdin.readLineSync();
  print("Digite sua altura (utilize . ao invés de , para separar os m dos cm)");
  String? heigthInput = stdin.readLineSync();
  print("Digite seu peso");
  String? weigthInput = stdin.readLineSync();

  if (nameInput != null && ageInput != null && heigthInput != null && weigthInput != null){
    double heigth = double.parse(heigthInput);
    double weigth = double.parse(weigthInput);

    double imc = calculateIMC(heigth: heigth, weigth: weigth);
    String imcType = imcDictionary(imc);
    print("Nome: $nameInput, Idade: $ageInput, IMC: $imc, $imcType");
  }
}

double calculateIMC({required double heigth, required double weigth}){
  double imc = weigth/(heigth*heigth);

  return imc;
}

String imcDictionary(double imc) {
  if (imc < 17) {
    return "Muito abaixo do peso";
  }
   else if (imc >= 17 && imc <= 18.49) {
    return "Abaixo do peso";
  }
   else if (imc >= 18.50 && imc <= 24.99) {
    return "Peso normal";
  }
   else if (imc >= 25 && imc <= 29.99) {
    return "Acima do peso";
  }
   else if (imc >= 30 && imc <= 34.99) {
    return "Obesidade I";
  }
   else if (imc >= 35 && imc <= 39.99) {
    return "Obesidade II (severa)";
  }
  else {
    return "Obesidade III (mórbida";
  }
}
