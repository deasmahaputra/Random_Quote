import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_app/bloc/quote_event.dart';
import 'package:quote_app/bloc/quote_state.dart';
import 'package:quote_app/models/quote.dart';
import 'package:quote_app/repositories/quote_repository.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState>{

  final QuoteRepository quoteRepository;

  QuoteBloc({@required this.quoteRepository}) : assert(quoteRepository != null);

  @override
  QuoteState get initialState => QuoteEmpty();

  @override
  Stream<QuoteState> mapEventToState(QuoteEvent event) async* {
    if(event is FetchQuote){
      yield QuoteLoading();
    }
    try{
      final Quote quote = await quoteRepository.fetchQuote();
      yield QuoteLoaded(quote: quote);
    }catch(_){
      yield QuoteError();
    }
  }


}