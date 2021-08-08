import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_app/repositories/quote_api_client.dart';
import 'package:quote_app/repositories/quote_repository.dart';
import 'package:http/http.dart' as http;
import 'package:quote_app/views/home_page.dart';

import 'bloc/quote_bloc.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  final QuoteRepository repository = QuoteRepository(quoteApiClient: QuoteApiClient(
    httpClient: http.Client(),
    ),
  );
  runApp(MyApp(repository : repository,));
}

class MyApp extends StatelessWidget {
  final QuoteRepository repository;

  MyApp({Key key, @required this.repository})
      :assert(repository != null),
      super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quote App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quote'),
        ),
        body: BlocProvider(
          create: (context) => QuoteBloc(quoteRepository: repository),
          child: HomePage(),
        ),
      ),
    );
  }
}

class SimpleBlocDelegate extends BlocDelegate {

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}
