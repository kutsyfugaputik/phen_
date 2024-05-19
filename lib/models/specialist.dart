class Specialist {
  final int id;
  final String firstName;
  final String name;
  final String fatherName;
  final int stage;
  final String info;
  final List imgs;

  Specialist(
      {required this.id,
      required this.firstName,
      required this.name,
      required this.fatherName,
      required this.stage,
      required this.info,
      required this.imgs});
}
// готовый список(в будущем изменится) 
List<Specialist> specs = [
  Specialist(
      id: 0,
      firstName: 'Шарикова',
      name: 'Светлана',
      fatherName: 'Федоровна',
      stage: 2,
      info:
          'Мастер-колорист, предлагает индивидуальные цветовые решения и стильные образы для каждого клиента',
      imgs: ['work_14', 'work_13','work_17']),

  Specialist(
      id: 1,
      firstName: 'Тружко',
      name: 'Татьяна',
      fatherName: 'Васильевна',
      stage: 4,
      info:
          'Детский мастер, специализируется на творческих и ярких стрижках для детей',
      imgs: ['work_4','work_5','work_1']),
  Specialist(
      id: 2,
      firstName: 'Васильева',
      name: 'Маргарита',
      fatherName: 'Петровна',
      stage: 5,
      info:
          'Парикмахер-универсал, предлагает широкий спектр услуг по уходу за волосами и созданию уникальных образов',
      imgs: ['work_6','work_10','work_12','work_19','work_16']),

  Specialist(
      id: 3,
      firstName: 'Кот',
      name: 'Луиза',
      fatherName: 'Ивановна',
      stage: 1,
      info:
          'Специалист по колористике, поможет подобрать идеальный цвет волос, соответствующий вашему стилю и типу внешности',
      imgs: ['work_2','work_15','work_18']),

  Specialist(
      id: 4,
      firstName: 'Доброва',
      name: 'Карина',
      fatherName: 'Валерьевна',
      stage: 4,
      info:
          'Мужской мастер, внимательно выслушает ваши пожелания и предложит стильные и модные варианты стрижек и укладок',
      imgs: ['work_7','work_8','work_9']),
];