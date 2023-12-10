import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transition Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Transitions Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Row(
            children: <Widget>[
              Expanded(
                child: OpenContainer(
                  closedBuilder: ((context, _) {
                    return const _ContentsCard(
                      imagePath: 'https://placehold.jp/300x300.png?text=dog',
                      title: 'Title',
                      subTitle: 'This is dog.',
                    );
                  }),
                  openBuilder: ((context, _) {
                    return const _ContentsPage(
                      imagePath: 'https://placehold.jp/300x300.png?text=dog',
                      title: 'Title',
                      subTitle: 'This is dog. Dogs are so cool.',
                    );
                  }),
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: OpenContainer(
                  closedBuilder: ((context, _) {
                    return const _ContentsCard(
                      imagePath: 'https://placehold.jp/300x300.png?text=cat',
                      title: 'Title',
                      subTitle: 'This is cat.',
                    );
                  }),
                  openBuilder: ((context, _) {
                    return const _ContentsPage(
                      imagePath: 'https://placehold.jp/300x300.png?text=cat',
                      title: 'Title',
                      subTitle: 'This is cat. Cats are so cute.',
                    );
                  }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ContentsCard extends StatelessWidget {
  const _ContentsCard({
    required this.imagePath,
    required this.title,
    required this.subTitle,
  });

  final String imagePath;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 225,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.black38,
            height: 150,
            child: Center(
              child: Image.network(
                imagePath,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subTitle,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContentsPage extends StatelessWidget {
  const _ContentsPage({
    required this.imagePath,
    required this.title,
    required this.subTitle,
  });

  final String imagePath;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read more'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.black38,
            child: Center(
              child: Image.network(
                imagePath,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title, style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 10),
                Text(
                  subTitle,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
