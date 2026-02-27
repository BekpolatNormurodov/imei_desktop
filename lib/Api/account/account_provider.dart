import 'package:imei/library.dart';

enum AccountState { intial, waiting, success, error }

class AccountProvider extends ChangeNotifier {
  AccountState state = AccountState.intial;
  set(AccountState value) {
    state = value;
    notifyListeners();
  }

  AccountModel? data;

  Future getData() async {
    set(AccountState.waiting);
    try {
      data = (await AccountService().accountService())!;
      set(AccountState.success);
    } catch (e) {
      set(AccountState.error);
    }
  }
}
