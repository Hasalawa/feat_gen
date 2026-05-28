import 'dart:io';

// Format Class names (e.g., user-profile -> UserProfile)
String toPascalCase(String text) {
  if (!text.contains('-') && !text.contains('_')) {
    return text[0].toUpperCase() + text.substring(1);
  }
  return text.split(RegExp(r'[-_]')).map((word) {
    if (word.isEmpty) return '';
    return word[0].toUpperCase() + word.substring(1).toLowerCase();
  }).join('');
}

// Format File names (e.g., user-profile -> user_profile)
String toSnakeCase(String text) {
  return text.replaceAll('-', '_').toLowerCase();
}

void generateFlutterFeature(String featureName) {
  final featureDir = Directory(featureName);

  if (featureDir.existsSync()) {
    print('⚠️ Error: A feature named "$featureName" already exists!');
    exit(1);
  }

  print('📂 Creating Flutter directories for $featureName...');
  featureDir.createSync(recursive: true);

  // Flutter Feature-First package structure
  final subFolders = ['screens', 'controllers', 'models', 'services', 'widgets'];
  for (var folder in subFolders) {
    Directory('${featureDir.path}/$folder').createSync();
  }

  final className = toPascalCase(featureName);
  final fileName = toSnakeCase(featureName);

  print('📄 Generating Flutter boilerplate code...');

  // 1. Screen File (UI)
  File('${featureDir.path}/screens/${fileName}_screen.dart')
      .writeAsStringSync(getFlutterScreenTemplate(className));

  // 2. Controller File (Logic/State)
  File('${featureDir.path}/controllers/${fileName}_controller.dart')
      .writeAsStringSync(getFlutterControllerTemplate(className));

  // 3. Model File (Data)
  File('${featureDir.path}/models/${fileName}_model.dart')
      .writeAsStringSync(getFlutterModelTemplate(className));

  // 4. Service File (API/Local DB)
  File('${featureDir.path}/services/${fileName}_service.dart')
      .writeAsStringSync(getFlutterServiceTemplate(className));

  print('✅ New Flutter Feature generated successfully!');
}

// ==========================================
// FLUTTER TEMPLATE ENGINE
// ==========================================

String getFlutterScreenTemplate(String className) => '''
import 'package:flutter/material.dart';

class ${className}Screen extends StatelessWidget {
  const ${className}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('$className'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          '$className feature is working perfectly!',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
''';

String getFlutterControllerTemplate(String className) => '''
import 'package:flutter/material.dart';

// You can convert this to GetxController, ChangeNotifier (Provider), or Bloc
class ${className}Controller extends ChangeNotifier {
  
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
  
  // TODO: Add your feature logic here
}
''';

String getFlutterModelTemplate(String className) => '''
class ${className}Model {
  final String id;

  ${className}Model({required this.id});

  factory ${className}Model.fromJson(Map<String, dynamic> json) {
    return ${className}Model(
      id: json['id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}
''';

String getFlutterServiceTemplate(String className) => '''
class ${className}Service {
  
  // Example API call function
  Future<void> fetch${className}Data() async {
    try {
      // TODO: Implement API call or Local Cache logic here
    } catch (e) {
      throw Exception('Failed to load data: \$e');
    }
  }
}
''';