class ArgParser {
  final Map<String, dynamic> _options = {};

  void addOption(String name, {String? abbr, String? help}) {
    // Add option to parser
  }

  Map<String, dynamic> parse(List<String> arguments) {
    for (var i = 0; i < arguments.length; i++) {
      final arg = arguments[i];
      if (arg.startsWith('--')) {
        final key = arg.substring(2);
        final value = i + 1 < arguments.length ? arguments[i + 1] : null;
        _options[key] = value;
      }
    }
    return _options;
  }
}
