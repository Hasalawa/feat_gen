import 'dart:io';
import 'package:args/args.dart';
import '../lib/spring_generator.dart';

void main(List<String> arguments) {
  // 1. ප්‍රධාන Parser එක හදාගැනීම
  final parser = ArgParser();

  // 2. 'create' කියන command එක සහ ඒකේ options define කිරීම
  final createCommand = ArgParser();
  createCommand.addOption(
    'framework',
    abbr: 'f',
    help: 'Target framework (spring/flutter)',
    allowed: ['spring', 'flutter'],
    defaultsTo: 'spring', // අපි මුලින් Spring Boot වලට හදන නිසා
  );

  parser.addCommand('create', createCommand);

  // Help flag එක
  parser.addFlag('help', abbr: 'h', negatable: false, help: 'Show usage information');

  try {
    // 3. User type කරන දේ parse කිරීම
    final argResults = parser.parse(arguments);

    if (argResults['help'] as bool) {
      printUsage(parser);
      return;
    }

    // 4. Command එක මොකක්ද කියලා අඳුරගෙන අදාළ වැඩේ කිරීම
    if (argResults.command?.name == 'create') {
      final createResults = argResults.command!;

      // Feature එකේ නම ගන්නවා (e.g., product-catalog)
      final featureName = createResults.rest.isNotEmpty ? createResults.rest.first : null;
      final framework = createResults['framework'];

      if (featureName == null) {
        print('❌ Error: Feature name එකක් ලබා දෙන්න.');
        print('   උදාහරණ: feat_gen create product-catalog');
        exit(1); // Error එකක් එක්ක program එක නවත්තනවා
      }

      print('===============================================');
      print('Generating Feature-First structure...');
      print('===============================================\n');

      print('📌 Feature: $featureName');
      print('🛠️ Framework: $framework\n');

      if (framework == 'spring') {
        generateSpringFeature(featureName!);
      } else if (framework == 'flutter') {
        print('🚧 Flutter generation තාම හැදුවෙ නෑ!');
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

// Help menu එක පෙන්වන function එක
void printUsage(ArgParser parser) {
  print('\n💡 FeatGen - Feature-First Architecture Generator');
  print('Usage: feat_gen <command> [arguments]');
  print('\nAvailable commands:');
  print('  create <feature_name>   Create a new feature structure');
  print('\nOptions:');
  print(parser.usage);
}