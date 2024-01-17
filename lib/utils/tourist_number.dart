String getTouristNumberText(int number) {
  switch (number) {
    case 1:
      return 'Первый турист';
    case 2:
      return 'Второй турист';
    case 3:
      return 'Третий турист';
    case 4:
      return 'Четвертый турист';
    case 5:
      return 'Пятый турист';
    default:
      return 'Турист №$number';
  }
}