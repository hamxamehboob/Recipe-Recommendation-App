extension Capitialize on String {
  String capitilize() {
    return this[0].toUpperCase() + substring(1);
  }
}
