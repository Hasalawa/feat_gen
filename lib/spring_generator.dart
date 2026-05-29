import 'dart:io';

String toPascalCase(String text) {
  if (!text.contains('-') && !text.contains('_')) {
    return text[0].toUpperCase() + text.substring(1);
  }
  return text.split(RegExp(r'[-_]')).map((word) {
    if (word.isEmpty) return '';
    return word[0].toUpperCase() + word.substring(1).toLowerCase();
  }).join('');
}

// 1. Let's set a Base Package that can be taken from a CLI argument in the future
const String basePackage = "com.callisto.app";

void generateSpringFeature(String featureName, String basePackage, String dbType) {
  final featureDir = Directory(featureName);

  if (featureDir.existsSync()) {
    print('⚠️ Error: A feature named "$featureName" already exists!');
    exit(1);
  }

  print('📂 Creating directories for $featureName...');
  featureDir.createSync(recursive: true);

  final subFolders = ['controller', 'service', 'repository', 'dto', 'entity'];
  for (var folder in subFolders) {
    Directory('${featureDir.path}/$folder').createSync();
  }

  final className = toPascalCase(featureName);
  final featurePackage = featureName.replaceAll('-', '').toLowerCase();
  final fullPackage = '$basePackage.$featurePackage';

  print('📄 Generating Spring Boot Boilerplate code for $dbType...');

  File('${featureDir.path}/controller/${className}Controller.java')
      .writeAsStringSync(getControllerTemplate(fullPackage, className, featureName));

  File('${featureDir.path}/service/${className}Service.java')
      .writeAsStringSync(getServiceTemplate(fullPackage, className));

  // 💡 Switch Repository and Entity templates based on DB Type
  if (dbType == 'firebase') {
    File('${featureDir.path}/repository/${className}Repository.java')
        .writeAsStringSync(getFirebaseRepositoryTemplate(fullPackage, className, featureName));

    File('${featureDir.path}/entity/${className}.java')
        .writeAsStringSync(getFirebaseEntityTemplate(fullPackage, className));
  } else {
    // Default JPA (MySQL) Templates
    File('${featureDir.path}/repository/${className}Repository.java')
        .writeAsStringSync(getJpaRepositoryTemplate(fullPackage, className));

    File('${featureDir.path}/entity/${className}.java')
        .writeAsStringSync(getJpaEntityTemplate(fullPackage, className, featureName));
  }

  // DTO files
  File('${featureDir.path}/dto/${className}Request.java')
      .writeAsStringSync('package $fullPackage.dto;\n\npublic class ${className}Request {}\n');
  File('${featureDir.path}/dto/${className}Response.java')
      .writeAsStringSync('package $fullPackage.dto;\n\npublic class ${className}Response {}\n');

  print('✅ New Spring Boot Feature generated successfully!');
}

// ==========================================
// TEMPLATE ENGINE (Boilerplate Codes)
// ==========================================

String getControllerTemplate(String pkg, String className, String featureName) => '''
package $pkg.controller;

import $pkg.service.${className}Service;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/${featureName.replaceAll('-', '/')}")
public class ${className}Controller {

    private final ${className}Service service;

    public ${className}Controller(${className}Service service) {
        this.service = service;
    }

    @GetMapping
    public ResponseEntity<String> testEndpoint() {
        return ResponseEntity.ok("$className Feature is working perfectly!");
    }
}
''';

String getServiceTemplate(String pkg, String className) => '''
package $pkg.service;

import $pkg.repository.${className}Repository;
import org.springframework.stereotype.Service;

@Service
public class ${className}Service {

    private final ${className}Repository repository;

    public ${className}Service(${className}Repository repository) {
        this.repository = repository;
    }
}
''';

String getJpaRepositoryTemplate(String pkg, String className) => '''
package $pkg.repository;

import $pkg.entity.$className;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ${className}Repository extends JpaRepository<$className, Long> {
}
''';

String getJpaEntityTemplate(String pkg, String className, String featureName) => '''
package $pkg.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "${featureName.replaceAll('-', '_')}")
public class $className {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // TODO: Add extra fields here

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
''';

// ==========================================
// FIREBASE TEMPLATES
// ==========================================

String getFirebaseEntityTemplate(String pkg, String className) => '''
package $pkg.entity;

// POJO class for Firebase Firestore
public class $className {

    private String id; // Firestore uses String for document IDs

    // TODO: Add extra fields here

    public $className() {}

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
''';

String getFirebaseRepositoryTemplate(String pkg, String className, String featureName) => '''
package $pkg.repository;

import $pkg.entity.$className;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.CollectionReference;
import org.springframework.stereotype.Repository;

@Repository
public class ${className}Repository {

    private final Firestore firestore;
    private final CollectionReference collection;

    public ${className}Repository(Firestore firestore) {
        this.firestore = firestore;
        // Defines the Firestore collection name dynamically
        this.collection = firestore.collection("${featureName.replaceAll('-', '_')}");
    }

    // TODO: Add Firestore CRUD operations here (save, findById, etc.)
}
''';