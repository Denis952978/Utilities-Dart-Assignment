import 'dart:io';

// String Manipulation Function
void stringManipulation() {
  String str1 = "Hello";
  String str2 = "World";

  // String concatenation
  String concatenated = "$str1 $str2";
  print("Concatenated String: $concatenated");

  // String interpolation
  String interpolated = "Interpolation: $str1, $str2!";
  print(interpolated);

  // Substring extraction
  String substring = concatenated.substring(6, 11);
  print("Substring: $substring");

  // Case conversion
  print("Uppercase: ${concatenated.toUpperCase()}");
  print("Lowercase: ${concatenated.toLowerCase()}");

  // Reverse string
  String reversed = concatenated.split('').reversed.join('');
  print("Reversed String: $reversed");

  // Length of string
  print("Length of String: ${concatenated.length}");
}

// Collections Function (Lists, Sets, Maps)
void collectionsExample() {
  // List
  List<String> fruits = ["Apple", "Banana", "Cherry"];
  fruits.add("Dragonfruit");
  fruits.remove("Banana");
  print("List Example: $fruits");

  // Iterate over List
  fruits.forEach((fruit) => print("Fruit: $fruit"));

  // Set
  Set<int> uniqueNumbers = {1, 2, 3, 3, 4};
  uniqueNumbers.add(5);
  uniqueNumbers.remove(1);
  print("Set Example (unique values): $uniqueNumbers");

  // Map
  Map<String, int> fruitPrices = {"Apple": 3, "Banana": 2, "Cherry": 5};
  fruitPrices["Dragonfruit"] = 7;
  fruitPrices.remove("Banana");
  print("Map Example: $fruitPrices");

  // Iterate over Map
  fruitPrices.forEach((key, value) {
    print("Fruit: $key, Price: $value");
  });
}

// File Handling Function
Future<void> fileHandlingExample() async {
  try {
    // File paths
    String inputPath = "input.txt";
    String outputPath = "output.txt";

    // Check if the input file exists
    File inputFile = File(inputPath);
    if (await inputFile.exists()) {
      // Read content from input file
      String content = await inputFile.readAsString();
      print("Content of input file: $content");

      // Write processed content to output file
      File outputFile = File(outputPath);
      await outputFile.writeAsString("Processed Content:\n$content");
      print("Content written to output file at $outputPath.");
    } else {
      print("Input file does not exist. Create 'input.txt' with some content.");
    }
  } catch (e) {
    print("Error during file operations: $e");
  }
}

// Date and Time Function
void dateTimeExample() {
  DateTime now = DateTime.now();
  print("Current Date and Time: $now");

  // Format Date
  String formattedDate = "${now.day}-${now.month}-${now.year}";
  print("Formatted Date: $formattedDate");

  // Add/Subtract days
  DateTime future = now.add(Duration(days: 5));
  DateTime past = now.subtract(Duration(days: 5));
  print("5 Days in Future: $future");
  print("5 Days in Past: $past");

  // Calculate difference between two dates
  DateTime someDate = DateTime(2023, 11, 15);
  Duration difference = now.difference(someDate);
  print("Difference between dates: ${difference.inDays} days");
}

// Combined Application
Future<void> combinedApplication() async {
  List<String> processedData = [];

  print("Enter a string for processing:");
  String? userInput = stdin.readLineSync();

  if (userInput == null || userInput.isEmpty) {
    print("No input provided.");
    return;
  }

  // Perform string manipulation
  String reversed = userInput.split('').reversed.join('');
  int length = userInput.length;
  processedData.add("Original: $userInput");
  processedData.add("Reversed: $reversed");
  processedData.add("Length: $length");

  // Log with DateTime
  DateTime timestamp = DateTime.now();
  processedData.add("Processed on: $timestamp");

  // Save to file
  File outputFile = File("log.txt");
  await outputFile.writeAsString(processedData.join('\n'));
  print("Data saved to log.txt");

  // Display stored data
  print("\nProcessed Data:");
  processedData.forEach(print);
}

// Main Function to Run the Program
void main() async {
  print("Choose an option:");
  print("1. String Manipulation");
  print("2. Collections (Lists, Sets, Maps)");
  print("3. File Handling");
  print("4. Date and Time");
  print("5. Combined Application");

  String? choice = stdin.readLineSync();

  switch (choice) {
    case '1':
      stringManipulation();
      break;
    case '2':
      collectionsExample();
      break;
    case '3':
      await fileHandlingExample();
      break;
    case '4':
      dateTimeExample();
      break;
    case '5':
      await combinedApplication();
      break;
    default:
      print("Invalid choice. Please select a valid option.");
  }
}
