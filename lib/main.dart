import 'package:counter_bloc/UI/widgets/Pages/profile_page.dart';
import 'package:counter_bloc/UI/widgets/Pages/search_page.dart';
import 'package:flutter/material.dart';
import 'UI/widgets/Pages/home_page.dart';
import 'bloc/CounterEvent.dart';
import 'bloc/counterBloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter Bloc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(title: 'Counter Bloc'),
    );
  }
}

class MainPage extends StatefulWidget {
  final String title;
// route to pages
  MainPage({super.key, required this.title});

  @override
  _MainPageState createState() => _MainPageState();
}

List pages = [
  const HomePage(),
  const SearchPage(),
  const ProfilePage(),
];
int currentIndex = 0;
void onTap(int index) {
  setState(() {
    currentIndex = index;
  });
}

class _MainPageState extends State<MainPage> {
  final _bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: 1,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.red,
        fixedColor: Colors.red,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.apps),
          ),
          BottomNavigationBarItem(
            label: 'person',
            icon: Icon(Icons.person),
          ),
          BottomNavigationBarItem(
            label: 'bar',
            icon: Icon(Icons.bar_chart),
          ),
          BottomNavigationBarItem(
            label: 'search',
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: pages[0],
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _bloc.counterEventSink.add(IncrementCounter());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 5,
          ),
          FloatingActionButton(
            onPressed: () {
              _bloc.counterEventSink.add(decrementCounter());
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
