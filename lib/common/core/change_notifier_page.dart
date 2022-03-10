import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ChangeNotifierPage<T extends ChangeNotifier>
    extends StatelessWidget {
  final Widget? child;
  final bool lazy;
  final Key? changeNotifierKey;

  const ChangeNotifierPage({
    this.child,
    this.lazy = true,
    this.changeNotifierKey,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      key: changeNotifierKey,
      lazy: lazy,
      create: (context) => create(context),
      builder: (context, child) {
        return buildWidget(context, child);
      },
      child: child,
    );
  }

  Widget buildWidget(BuildContext context, Widget? child);

  T provider(
    BuildContext context,
    bool listen,
  ) {
    return Provider.of<T>(
      context,
      listen: listen,
    );
  }

  T create(BuildContext context);
}
