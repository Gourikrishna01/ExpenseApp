import 'package:hive/hive.dart';

part 'ExpenseModel.g.dart';

@HiveType(typeId: 1)
class ExpenseModel {
  @HiveField(0)
  late String username;
  @HiveField(1)
  late String fullname;
  @HiveField(2)
  late String Email;
  @HiveField(3)
  late String password;
  ExpenseModel(
      {required this.username,
      required this.Email,
      required this.fullname,
      required this.password});
}
