class StreamTicker {
  const StreamTicker();
  Stream<int> tickInk() {
    return Stream.periodic(const Duration(seconds: 1), (x) => x + 1);
  }

  Stream<int> tickDec({required int ticks}) {
    return Stream.periodic(const Duration(seconds: 1), (x) => ticks - x - 1).take(ticks);
  }
}
