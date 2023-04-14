import 'controllers/bank_controller.dart';
import 'exceptions/bank_controller_exceptions.dart';
import 'models/account.dart';

void main() {
  // Criando o banco
  BankController bankController = BankController();

  // Adicionando contas
  bankController.addAccount(
      id: "Ricarth",
      account:
          Account(name: "Ricarth Lima", balance: 400, isAuthenticated: true));

  bankController.addAccount(
      id: "Kako",
      account:
          Account(name: "Caio Couto", balance: 600, isAuthenticated: true));

  // Fazendo transferência
  try{
    bool result = bankController.makeTransfer(
        idSender: "Kako", idReceiver: "Ricarth", amount: 500
    );

    // Observando resultado
    if (result) {
      print("Transação concluída com sucesso.");
    }
  } on SenderIdInvalidException catch (exception) {
    print("O ID ${exception.idSender} do remetente não é válido.");
  } on ReceiverIdInvalidException catch (exception) {
    print("O ID ${exception.idReceiver} do destinatário não é válido.");
  } on SenderNotAuthenticatedException catch (exception) {
    print("O usuário remetente de ID ${exception.idSender} não é autenticado.");
  } on SenderBalanceLowerThanAmountException catch (exception) {
    print("O usuário de id ${exception.idSender} tentou enviar ${exception.amount} mas só tem ${exception.senderBalance}.");
  } on Exception {
    print("Algo deu errado.");
  };
}
