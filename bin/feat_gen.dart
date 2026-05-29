import 'dart:io';
import 'package:args/args.dart';
import '../lib/spring_generator.dart';
import '../lib/flutter_generator.dart';

void main(List<String> arguments) {
  // 1. Create the main parser
  final parser = ArgParser();

  // 2. Define the 'create' command and its options
  final createCommand = ArgParser();
  createCommand.addOption(
    'framework',
    abbr: 'f',
    help: 'Target framework (spring/flutter)',
    allowed: ['spring', 'flutter'],
    defaultsTo: 'spring', // Because we are initially building for Spring Boot
  );

  createCommand.addOption(
    'package',
    abbr: 'p',
    help: 'Base package name',
    defaultsTo: 'com.callisto.app', // If a package is not provided, this will be the default
  );

  createCommand.addOption(
    'db',
    help: 'Target database architecture (jpa/firebase)',
    allowed: ['jpa', 'firebase'],
    defaultsTo: 'jpa', // Default JPA
  );

  parser.addCommand('create', createCommand);

  // Help flag
  parser.addFlag('help', abbr: 'h', negatable: false, help: 'Show usage information');

  try {
    // 3. Parse user input
    final argResults = parser.parse(arguments);

    if (argResults['help'] as bool) {
      printUsage(parser);
      return;
    }

    // 4. Identify the command and execute the relevant task
    if (argResults.command?.name == 'create') {
      final createResults = argResults.command!;

      // Get the feature name (e.g., product-catalog)
      final featureName = createResults.rest.isNotEmpty ? createResults.rest.first : null;
      final framework = createResults['framework'];
      final basePackage = createResults['package'];
      final dbType = createResults['db'];

      if (featureName == null) {
        print('❌ Error: Please provide a feature name.');
        print('   Example: feat_gen create product-catalog');
        exit(1); // Terminate the program with an error
      }

      print('===============================================');
      print('Generating Feature-First structure...');
      print('===============================================\n');

      print('📌 Feature: $featureName');
      print('🛠️ Framework: $framework\n');
      print('📦 Package: $basePackage\n');
      print('🛢️ Database: $dbType\n');

      if (framework == 'spring') {
        generateSpringFeature(featureName, basePackage, dbType);
      } else if (framework == 'flutter') {
        generateFlutterFeature(featureName, dbType);
      }

    } else {
      print('❌ Error: Unknown command.');
      printUsage(parser);
      exit(1);
    }
  } catch (e) {
    print('❌ Error: ${e.toString()}');
    printUsage(parser);
    exit(1);
  }
}

// Function to show the help menu
void printUsage(ArgParser parser) {
  print('\n FeatGen - Feature-First Architecture Generator');
  print('Usage: feat_gen <command> [arguments]');

  print('\nAvailable commands:');
  print('  create <feature_name>   Create a new feature structure');

  print('\nGlobal Options:');
  print(parser.usage);

  // Extract and print options specifically for the 'create' command
  final createUsage = parser.commands['create']?.usage;
  if (createUsage != null) {
    print('\nOptions for "create" command:');
    print(createUsage);
  }

  print('\nExamples:');
  print('  feat_gen create ceylon-cart-auth');
  print('  feat_gen create worker-profile -f flutter');
  print('  feat_gen create jewelry-catalog -p com.pinkie.app --db firebase');
  print('');
}