import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/presentation/providers/example_provider.dart';
import 'package:flutter_boilerplate/presentation/widgets/example_widget.dart';
import 'package:provider/provider.dart';

class ExamplePage extends StatelessWidget {
  static const String routeName = '/example';
  const ExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ExampleProvider>(
      create: (context) => ExampleProvider(
        context: context,
      ),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Example'),
          ),
          body: Consumer<ExampleProvider>(
            builder: (context, provider, child) => ExampleWidget(
              counter: provider.counter,
              onCounterTap: provider.count,
            ),
          ),
        );
      },
    );
  }
}
