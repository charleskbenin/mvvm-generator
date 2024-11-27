import 'args.dart';

import 'dart:io';

void createMmvcStructure(String folderName) {
  Directory baseDir = Directory.current;
  Directory productDir = Directory('${baseDir.path}/$folderName');
  Directory dataDir = Directory('${productDir.path}/data');
  Directory domainDir = Directory('${productDir.path}/domain');
  Directory presentationDir = Directory('${productDir.path}/presentation');
  Directory screensDir = Directory('${presentationDir.path}/screens');
  Directory viewModelDir = Directory('${presentationDir.path}/view_model');
  Directory widgetsDir = Directory('${presentationDir.path}/widgets');

  dataDir.createSync(recursive: true);
  Directory('${dataDir.path}/datasource').createSync(recursive: true);
  Directory('${dataDir.path}/repositories').createSync(recursive: true);
  domainDir.createSync(recursive: true);
  screensDir.createSync(recursive: true);
  viewModelDir.createSync(recursive: true);
  widgetsDir.createSync(recursive: true);

  // Create files in the directories
  File('${dataDir.path}/datasource/${productDir.path.split('/').last}_local_datasource.dart')
      .writeAsStringSync('// ${productDir.path.split('/').last} local datasource');
  File('${dataDir.path}/datasource/${productDir.path.split('/').last}_remote_datasource.dart')
      .writeAsStringSync('// ${productDir.path.split('/').last} remote datasource');
  File('${dataDir.path}/repositories/${productDir.path.split('/').last}_repository.dart')
      .writeAsStringSync('// ${productDir.path.split('/').last} repository');
  File('${viewModelDir.path}/${productDir.path.split('/').last}_view_model.dart')
      .writeAsStringSync('// ${productDir.path.split('/').last} view model');
}

void main(List<String> arguments) {
  final parser = ArgParser();
  parser.addOption('folder-name', help: 'Name of the folder to create');

  final args = parser.parse(arguments);
  final folderName = args['folder-name'] as String?;

  if (folderName == null) {
    print('Please provide a folder name using the --folder-name option');
    exit(1);
  }

  createMmvcStructure(folderName);
}
