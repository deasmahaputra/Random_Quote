import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:quote_app/models/quote.dart';

abstract class QuoteState extends Equatable {

  const QuoteState();

  @override
  List<Object> get props => [];

}

class QuoteEmpty extends QuoteState{}

class QuoteLoading extends QuoteState{}

class QuoteLoaded extends QuoteState {
  final List<Quote> quote;

  const QuoteLoaded({@required this.quote}) : assert(quote != null);

  @override
  List<Object> get props => [quote];
}

class QuoteError extends QuoteState{}