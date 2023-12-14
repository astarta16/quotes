import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/quote_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quote of the Day'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Consumer<QuoteProvider>(
        builder: (context, quoteProvider, child) {
          final quote = quoteProvider.currentQuote;
          return quote != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 500),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return FadeTransition(
                              child: child, opacity: animation);
                        },
                        child: Text(
                          '“${quote.text}”',
                          key: ValueKey(quote.text),
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurpleAccent,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      '- ${quote.author}',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[700],
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                )
              : const CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Provider.of<QuoteProvider>(context, listen: false).nextQuote(),
        child: const Icon(Icons.autorenew),
        backgroundColor: Colors.deepPurple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
