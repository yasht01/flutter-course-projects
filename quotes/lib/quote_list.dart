import 'package:flutter/material.dart';
import 'quote.dart';

class QuotesList extends StatefulWidget {

  QuoteList quotesList = QuoteList();

  @override
  _QuotesListState createState() => _QuotesListState();
}

class _QuotesListState extends State<QuotesList> {

  void deleteQuote(Quote quote) {
    setState(() {
      widget.quotesList.quotes.remove(quote);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: widget.quotesList.quotes.map((quote) {
              return Column(
                children: [
                  SizedBox(height: 10.0),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            child: Text(
                              quote.text,
                              textScaleFactor: 1.5,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: TextButton(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      Text(
                                        'Delete Quote',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    print('Clicked!');
                                    deleteQuote(quote);
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Text(
                                    quote.author,
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                    ),
                                    textAlign: TextAlign.right,
                                    textScaleFactor: 1.3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
