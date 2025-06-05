extension DateEquals on DateTime {
  bool isEqualDay(DateTime d) {
    return day == d.day && month == d.month && year == d.year;
  }

  DateTime get getDate => DateTime(year, month, day);
}

Iterable<T> intersperse<T>(T element, Iterable<T> iterable) sync* {
  final iterator = iterable.iterator;
  if (iterator.moveNext()) {
    yield iterator.current;
    while (iterator.moveNext()) {
      yield element;
      yield iterator.current;
    }
  }
}
