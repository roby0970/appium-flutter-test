import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  var toggleState = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: mediaQuery.padding.top),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Semantics(
                  label: 'OpenScreen1',
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return Page(color: Colors.red.shade100);
                          },
                        ));
                      },
                      child: const Text("Go to screen 1")),
                ),
                Semantics(
                  label: 'OpenScreen2',
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return Page(color: Colors.green.shade100);
                          },
                        ));
                      },
                      child: const Text("Go to screen 2")),
                ),
              ],
            ),
            loremIpsum(),
            Semantics(
              label: 'Luster',
              child:
                  TextButton(onPressed: () {}, child: const Text("Nazdravlje")),
            ),
            loremIpsum(),
            Semantics(
              label: 'Kitica',
              child: TextButton(
                  onPressed: () {},
                  child: const Text(
                      "KiticaKiticaKiticaKiticaKiticaKiticaKiticaKiticaKiticaKitica")),
            ),
            Semantics(
              label: 'Prvi',
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: "prvi disabled", border: OutlineInputBorder()),
                enabled: false,
              ),
            ),
            Semantics(
                label: 'Drugi',
                child: TextFormField(
                  decoration: const InputDecoration(
                      hintText: "drugi enabled", border: OutlineInputBorder()),
                )),
            Semantics(
              label: 'Cekboks',
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    toggleState = !toggleState;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(child: Text("Label za cekboks")),
                    Switch.adaptive(
                        value: toggleState,
                        onChanged: (value) {
                          setState(() {
                            toggleState = value;
                          });
                        }),
                  ],
                ),
              ),
            ),
            loremIpsum(),
            loremIpsum(),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }

  Widget loremIpsum() {
    return const Text(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.");
  }
}

class Page extends StatefulWidget {
  final Color color;
  const Page({super.key, required this.color});
  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  var isLoading = false;

  void startTimeout(int interval) async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(Duration(seconds: interval));

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Semantics(
        label: 'ColorElementBg',
        child: Container(
          color: widget.color,
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(children: [
              Semantics(
                label: 'GoBack',
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Go back")),
              ),
              const SizedBox(
                height: 100,
              ),
              Semantics(
                label: 'BtnLoadingOff',
                child: TextButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            startTimeout(2);
                          },
                    child:
                        Text(!isLoading ? "Klik za loadanje" : "Sada loading")),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
