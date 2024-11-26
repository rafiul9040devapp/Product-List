// Utility function to generate a random 4-digit integer
import 'dart:math';

int generateProductCode() {
  final random = Random();
  return 1000 + random.nextInt(9000); // Generates a number between 1000 and 9999
}

// Utility function to calculate the total price
int calculateTotalPrice({ required int quantity, required int unitPrice}) {
  return quantity * unitPrice;
}

bool isValidUrl(String url) {
  final uri = Uri.tryParse(url);
  return uri != null && uri.hasScheme && uri.hasAuthority;
}


String getRandomPlaceholderUrl() {
  final random = Random();
  return placeholderUrls[random.nextInt(placeholderUrls.length)];
}

List<String> placeholderUrls = [
  'https://picsum.photos/150',
  'https://picsum.photos/300/200',
  'https://picsum.photos/600/400',
  'https://dummyimage.com/150x150',
  'https://dummyimage.com/300x200',
  'https://dummyimage.com/600x400',
];
