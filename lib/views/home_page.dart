import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quote_app/bloc/bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuoteBloc, QuoteState>(
      builder: (context, state) {
        if (state is QuoteEmpty) {
          BlocProvider.of<QuoteBloc>(context).add(FetchQuote());
        }
        if (state is QuoteError) {
          return Center(
            child: Text('failed to fetch quote'),
          );
        }
        if (state is QuoteLoaded) {
          return ListTile(
            // leading: Text(
            //   '${state.quote[0].id}',
            //   style: TextStyle(fontSize: 10.0),
            // ),
            title: Padding(
                padding: const EdgeInsets.all(16.0),
                child : Text(state.quote[0].quoteText,
                textAlign: TextAlign.center,
                style: new TextStyle(fontWeight: FontWeight.bold),)),
            isThreeLine: true,
            subtitle: Padding(
                padding: const EdgeInsets.all(16.0),
                child : Text(state.quote[0].quoteAuthor, textAlign: TextAlign.center)
            ),
            dense: true,
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}