import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/common/core/change_notifier_page.dart';
import 'package:flutter_boilerplate/presentation/providers/example_provider.dart';
import 'package:flutter_boilerplate/presentation/widgets/example_widget.dart';
import 'package:provider/provider.dart';

class ExamplePage extends ChangeNotifierPage<ExampleProvider> {
  static const String routeName = '/example';
  const ExamplePage({Key? key}) : super(key: key);

  @override
  Widget buildWidget(BuildContext context, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example'),
      ),
      body: Consumer<ExampleProvider>(
        builder: (context, provider, child) => Column(
          children: [
            ExampleWidget(
              counter: provider.counter,
              onCounterTap: provider.count,
            ),
            Divider(height: 0),
            Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Isolate'),
                  Text('Status : ${provider.isolateStatus}'),
                  Text('Stream Content'),
                  StreamBuilder(
                    stream: provider.stream,
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        case ConnectionState.active:
                          if (snapshot.hasData) {
                            return Text(snapshot.data.toString());
                          } else {
                            return SizedBox.shrink();
                          }
                        default:
                          return SizedBox.shrink();
                      }
                    },
                  ),
                  ButtonBar(
                    children: [
                      MaterialButton(
                        child: Text('Start'),
                        color: Colors.blue,
                        textColor: Colors.white,
                        elevation: 0,
                        onPressed: provider.startIsolate,
                      ),
                      MaterialButton(
                        child: Text('Stop'),
                        color: Colors.red,
                        elevation: 0,
                        onPressed: provider.stopIsolate,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ExampleProvider create(BuildContext context) {
    return ExampleProvider(
      context: context,
    );
  }
}
