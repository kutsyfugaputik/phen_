import 'package:isar/isar.dart';
import 'user.dart'; // Импортируем класс User

part 'order.g.dart';

@Collection()
class Order {
  Id id = Isar.autoIncrement;
  late int idService;
  late DateTime date;
  late String time;
  late int userId;

  // Конструктор класса Order
  Order({
    required this.idService,
    required this.date,
    required this.time,
    required this.userId
  }) ;
}