class Ticker {
  // constructor
  const Ticker();

  // function: the seconds as param, return a stream
  Stream<int> tick({required int ticks}) {
    return Stream.periodic(const Duration(seconds: 1), (x) => ticks - x - 1)
        .take(ticks);
  }
}
