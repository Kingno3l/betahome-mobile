class PaymentHelper {
  late double total;
  late double _installed;
  // final bool _isInstall = false;
  PaymentHelper(this.total) {
    // ignore: division_optimization
    _installed = (((80 * total) / 100).toInt()).toDouble();
  }

  get outright => total;

  get eightyPer => _installed;

  double installment(int interval) {
    return ((total / 90) * interval).ceil().toDouble();
  }

  // get isInstall => _isInstall;
}
