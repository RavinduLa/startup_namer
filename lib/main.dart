import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Welcome to Flutter',
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {

  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle _biggerFont = const TextStyle(fontSize: 20);

  @override
  Widget build(BuildContext context) {
    /*final wordPair = WordPair.random();
    return Text(wordPair.asPascalCase);*/

    return Scaffold(
      appBar: AppBar(
        title: Text("Startup name generator"),
    ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions()
  {
    return ListView.builder(
        padding: EdgeInsets.all(18),
        itemBuilder: (BuildContext _context, int i)
        {
          if(i.isOdd)
            {
              return Divider();
            }
          final int index = i ~/ 2;
          if (index >= _suggestions.length) {
            // ...then generate 10 more and add them to the
            // suggestions list.
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }//_buildSuggestions

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }

}
