import 'package:flutter/material.dart';
import 'new_delivery/delivery.dart';

import 'detail_derivery.dart';
import 'error.dart';

const maxWidth = 800.0;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spedisci&Vai',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  String deliveryIdController = "";

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: MediaQuery.of(context).size.width>maxWidth+150?
                EdgeInsets.only(left:(MediaQuery.of(context).size.width-maxWidth)/2):
                null,
              title: const Text('Spedisci & Vai',
                style: TextStyle(
                  color: Colors.black,
                )
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 150,
              child: Center(
                child: SizedBox(
                  width: maxWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextField(
                          onChanged: (newS) => {widget.deliveryIdController=newS},
                          keyboardType: TextInputType.number,
                          onSubmitted: (s) => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                try {
                                  return DetailDerivery(int.parse(s));
                                } catch(e){
                                  return Error();
                                }
                              })
                            ),
                          decoration: InputDecoration(
                            filled: true,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                            labelText: "Ricerca consegna",
                            suffixIcon: IconButton(
                              onPressed: ()=>Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  try {
                                    return DetailDerivery(int.parse(widget.deliveryIdController));
                                  } catch(e){
                                    return Error();
                                  }
                                })
                              ),
                              icon: const Icon(Icons.search_rounded)
                            ),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0))
                            )
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 200,
                      ),
                    ]
                  ),
                ),
              ),
            )
          )
        ]
      ),
      bottomNavigationBar: Wrap(
        children: [
          Center(
            child: SizedBox(
              width: maxWidth,
              child: Padding(
                padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
                child: FloatingActionButton.extended(
                  onPressed: () {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Delivery()),
                  );},
                  //icon: const Icon(Icons.add),
                  label: const Text("Effetua una nuova consegna"),
                ),
              ),
            ),
          ),
        ]
      ),
    );
  }
}
