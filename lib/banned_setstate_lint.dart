/// Support for doing something awesome.
///
/// More dartdocs go here.
library;

import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

export 'src/banned_setstate_lint_base.dart';

// TODO: Export any libraries intended for clients of this package.

PluginBase createPlugin() => _BannedSetStateLints();

class _BannedSetStateLints extends PluginBase {
  // Lint rules
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [BanSetState()];

  // Assists
  @override
  List<Assist> getAssists() => [];
}

class BanSetState extends DartLintRule {
  BanSetState() : super(code: _code);
  static const _code = LintCode(
    name: 'ban_set_state',
    problemMessage:
        "Don't use setState. Please use Bloc or another state management approach for better scalability and testability.",
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) async {
    context.registry.addMethodInvocation((node) {
      if (node.methodName.name == 'setState' && node.realTarget == null) {
        reporter.atNode(node, code);
      }
    });
  }
}
