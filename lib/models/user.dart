import 'package:isar/isar.dart';

part 'user.g.dart';
@Collection()
class User {
  Id id = Isar.autoIncrement;
  late String firstName;
 late String name;
  late String? fatherName;

  late String email;
  late String password;


}