class PriceFormatter {
  static String formatPrice(int price) {
    var priceStr = price.toString();
    var result = '';
    var count = 0;

    for (var i = priceStr.length - 1; i >= 0; i--) {
      result = priceStr[i] + result;
      count++;
      if (count == 3 && i != 0) {
        result = ' $result';
        count = 0;
      }
    }
    return result;
  }
}
