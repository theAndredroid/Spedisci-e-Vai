import 'package:flutter/material.dart';

import '../main.dart';

class SenderDetails extends StatefulWidget {
  List<TextEditingController> formController;

  SenderDetails(this.formController, {Key? key}) : super(key: key);
  
  @override
  State<SenderDetails> createState() => _SenderDetailsState();


}

class _SenderDetailsState extends State<SenderDetails>{
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 300,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: MediaQuery.of(context).size.width>maxWidth+150?
              EdgeInsets.only(left:(MediaQuery.of(context).size.width-maxWidth)/2):
              null,
            title: Text('Informazioni sul mittente',
              style: TextStyle(
                color: Colors.black,
              )
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Center(
            child: Container(
              width: maxWidth,
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height - 166
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children:[
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextField(
                          onChanged: (value) { },
                          textInputAction: TextInputAction.next,
                          controller: widget.formController[0],
                          textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                            labelText: "Cognome",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0))
                            )
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextField(
                          onChanged: (value) { },
                          textInputAction: TextInputAction.next,
                          controller: widget.formController[1],
                          textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                            labelText: "Nome",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0))
                            )
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 4,
                        child: TextField(
                          onChanged: (value) { },
                          textInputAction: TextInputAction.next,
                          controller: widget.formController[2],
                          textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                            labelText: "Città",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0))
                            )
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 2,
                        child: TextField(
                          onChanged: (value) { },
                          textInputAction: TextInputAction.next,
                          controller: widget.formController[3],
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                            labelText: "CAP",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0))
                            )
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 3,
                        child: TextField(
                          onChanged: (value) { },
                          textInputAction: TextInputAction.next,
                          controller: widget.formController[4],
                          textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                            labelText: "Provincia",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0))
                            )
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 5,
                        child: TextField(
                          onChanged: (value) { },
                          textInputAction: TextInputAction.next,
                          controller: widget.formController[5],
                          textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                            labelText: "Indirizzo",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0))
                            )
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 2,
                        child: TextField(
                          onChanged: (value) { },
                          textInputAction: TextInputAction.next,
                          controller: widget.formController[6],
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                            labelText: "Civico",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0))
                            )
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}