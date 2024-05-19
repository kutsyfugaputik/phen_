class Service {
  final int id;
  final String name_ser;
  final double price;
  final int time;
  final int id_specialis;
  final imagePath;

  Service(
      {required this.id,
      required this.name_ser,
      required this.price,
      required this.time,
      required this.id_specialis,
      required this.imagePath});
}
// готовый список(в будущем изменится) 
List<Service> servs = [
  Service(
      id: 1, name_ser: 'Женская стрижка', price: 600, time: 1, id_specialis: 2, imagePath:'assets/women.jpg'),
  Service(
      id: 2, name_ser: 'Мужская стрижка', price: 450, time: 1, id_specialis: 4, imagePath:'assets/men.jpg'),
  Service(
      id: 3, name_ser: 'Детская стрижка', price: 400, time: 1, id_specialis: 1, imagePath:'assets/child.jpg'),
  Service(
      id: 4, name_ser: 'Стрижка челка', price: 200, time: 1, id_specialis: 2, imagePath:'assets/chelka.jpg'),
  Service(id: 5, name_ser: 'Налысо', price: 600, time: 2, id_specialis: 2, imagePath:'assets/naliso.jpg'),
  Service(id: 6, name_ser: 'Окрашивание', price: 600, time: 3, id_specialis: 0, imagePath:'assets/diehair.jpg'),
];
