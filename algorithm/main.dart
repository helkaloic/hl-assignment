import 'dart:io';

void main() {
  manualInput();
  // testCases();
}

void manualInput() {
  try {
    String? input = stdin.readLineSync();
    List<int> arr = [];
    if (input != null && input.isNotEmpty) {
      arr = input.split(" ").map((e) => int.parse(e)).toList();
    }
    tasks(arr);
  } catch (e) {
    print(e.toString());
  }
}

void tasks(List<int> arr) {
  if (arr.length != 5 || arr.every((e) => e < 1)) {
    print("Invalid input");
    return;
  }

  // According to Dart docs: https://api.dart.dev/stable/3.3.3/dart-core/int-class.html
  // The default implementation of int is 64-bit two's complement integers
  // with operations that wrap to that range on overflow.

  int min = -1 >>> 1;
  int max = -1;
  int sum = 0;

  for (int i = 0; i < arr.length; i++) {
    sum += arr[i];
    if (arr[i] < min) {
      min = arr[i];
    }
    if (arr[i] > max) {
      max = arr[i];
    }
  }
  // Mini-Max Sum
  print("${sum - max} ${sum - min}");

  // Bonus tasks
  // Count total of array
  print("Bonus:");
  print("Count total of array: $sum");

  // Find min in array
  print("Find min in array: $min");

  // Find max in array
  print("Find max in array: $max");

  // Find even elements in array
  // element % 2 == 0
  print("Find even elements in array: ${arr.where((e) => e.isEven).toList()}");

  // Find odd elements in array
  // element % 2 != 0
  print("Find odd elements in array: ${arr.where((e) => e.isOdd).toList()}");
}

void testCases() {
  // Test case 1: General test case with positive integers.
  print("Test case 1: General test case with positive integers.");
  tasks([3, 2, 1, 5, 4]);

  // Test case 2: All elements are the same.
  print("\nTest case 2: All elements are the same.");
  tasks([10, 10, 10, 10, 10]);

  // Test case 3: One element is much larger than others.
  print("\nTest case 3: One element is much larger than others.");
  tasks([123456789, 2, 3, 1, 4]);

  // Test case 4: Edge case with maximum positive integers.
  print("\nTest case 4: Edge case with maximum positive integers.");
  tasks([2147483647, 2147483647, 2147483647, 2147483647, 2147483647]);

  // Test case 5: Edge case with minimum positive integers.
  print("\nTest case 5: Edge case with minimum positive integers.");
  tasks([1, 1, 1, 1, 1]);

  // Test case 6: All odd numbers.
  print("\nTest case 6: All odd numbers.");
  tasks([1, 3, 5, 7, 9]);

  // Test case 7: All even numbers.
  print("\nTest case 7: All even numbers.");
  tasks([2, 4, 6, 8, 10]);

  // Invalid
  // Test case 8: Contains negative numbers.
  print("\nTest case 8: Contains negative numbers.");
  tasks([-1, 3, 7, 9, -2]);

  // Test case 9: All negative numbers.
  print("\nTest case 9: All negative numbers.");
  tasks([-1, -3, -5, -9, -2]);

  // Test case 10: Input length is less than 5.
  print("\nTest case 10: Input length is less than 5.");
  tasks([1, 2]);

  // Test case 11: Input length is rather than 5.
  print("\nTest case 11: Input length is rather than 5.");
  tasks([1, 2, 3, 4, 5, 6]);

  // Test case 12: Empty input.
  print("\nTest case 12: Empty input.");
  tasks([]);
}
