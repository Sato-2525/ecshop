import 'package:ecshop_techpit/model/data/login_user/login_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//ログインユーザークラス
final loginUserProvider = Provider(
  (ref) => LoginUser(id: '12345', name: 'Taro'),
);

//ログインユーザークラスから名前だけを抽出
final loginUserNameProvider = Provider(
  (ref) => ref.watch(loginUserProvider.select((user) => user.name)),
);
