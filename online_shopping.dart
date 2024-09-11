void main() {
  // List of item prices in the cart
  List<double> cart = [15.0, 25.0, 8.0, 50.0, 5.0];

  // Step 1: Filter items under $10 using an anonymous function
  List<double> filteredCart = cart.where((price) => price >= 10.0).toList();
  print("Filtered Cart (Items >= \$10): $filteredCart");

  // Step 2: Apply discount using a higher-order function
  List<double> discountedCart = applyDiscount(filteredCart, (price) => price * 0.90); // 10% discount
  print("Cart after 10% discount: $discountedCart");

  // Step 3: Calculate the total including tax (optional parameter)
  double totalPrice = calculateTotal(discountedCart, taxRate: 0.05); // 5% tax
  print("Total price after tax: \$${totalPrice.toStringAsFixed(2)}");

  // Step 4: Apply recursive factorial discount based on the number of items
  int numberOfItems = discountedCart.length;
  double factorialDiscount = calculateFactorialDiscount(numberOfItems);
  print("Factorial discount: ${factorialDiscount}%");

  // Step 5: Apply the special factorial discount to the total price
  double finalPrice = totalPrice * (1 - factorialDiscount / 100);
  print("Final price after applying factorial discount: \$${finalPrice.toStringAsFixed(2)}");
}

// Function to calculate total price including optional tax
double calculateTotal(List<double> prices, {double taxRate = 0}) {
  double total = prices.reduce((sum, item) => sum + item);
  return total * (1 + taxRate); // Apply tax if provided
}

// Higher-order function to apply a discount
List<double> applyDiscount(List<double> prices, double Function(double) discountFunction) {
  return prices.map((price) => discountFunction(price)).toList();
}

// Recursive function to calculate a factorial-based discount
double calculateFactorialDiscount(int n) {
  if (n <= 1) {
    return 1;
  } else {
    return n * calculateFactorialDiscount(n - 1);
  }
}
