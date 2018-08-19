import 'dart:async';
import 'package:angular/core.dart';
import 'package:ethershare/src/utils/web3.dart';

class UserModel {
  String displayName;
  String coinbase;

  UserModel(String coinbase, String displayName) {
    this.coinbase = coinbase;
    this.displayName = '이더리움 회원';
  }

  String get avatar {
    return 'http://i.pravatar.cc/96';
  }
}

@Injectable()
class UserService {
  UserModel currentUser = null;

  Future<UserModel> authWithWeb3() async {
    final coinbase = getCoinbase();
    assert(coinbase != null);
    currentUser = new UserModel(coinbase, coinbase);
    return currentUser;
  }

  Future<UserModel> signOut() async {
    currentUser = null;
    return currentUser;
  }
}
