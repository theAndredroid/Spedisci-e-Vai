import 'package:flutter/material.dart';


class Error extends StatefulWidget {
  Error({Key? key}) : super(key: key);
  List<TextEditingController> formController=List.generate(20, (index)=>TextEditingController());
  
  @override
  State<Error> createState() => _ErrorState();
}

class _ErrorState extends State<Error>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 300,
            backgroundColor: Theme.of(context).colorScheme.onErrorContainer,
            iconTheme: IconThemeData(
              color: Theme.of(context).colorScheme.error,
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Si è riscontrato un problema',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                )
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height - 86
              ),
              child: Center(
                child: ElevatedButton(
                  onPressed: ()=>Navigator.pop(context),
                  child: Text("Torna indietro e riprova",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    )
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>((states) => Theme.of(context).colorScheme.onError),
                  ),
                ),
              ),
            )
          )
        ]
      ),
    );
  }
}