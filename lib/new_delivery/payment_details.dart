import 'package:flutter/material.dart';
import 'package:spedisci_e_vai/main.dart';

class PaymentDetails extends StatefulWidget {
  List<TextEditingController> formController;


  PaymentDetails(this.formController ,{Key? key}) : super(key: key);
  
  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();


}

class _PaymentDetailsState extends State<PaymentDetails>{
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
            title: Text('Mettodo di pagamento',
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
                          textInputAction: TextInputAction.next,
                          controller: widget.formController[14],
                          textCapitalization: TextCapitalization.words,
                          onChanged: (value) { },
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
                          controller: widget.formController[15],
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      textInputAction: TextInputAction.next,
                      controller: widget.formController[16],
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                        labelText: "Carta di Credito",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0))
                        )
                      ),
                    ),
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
                        flex: 2,
                        child: TextField(
                          onChanged: (value) { },
                          textInputAction: TextInputAction.next,
                          controller: widget.formController[17],
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                            labelText: "Mese",
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
                          controller: widget.formController[18],
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                            labelText: "Anno",
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
                          controller: widget.formController[19],
                          keyboardType: TextInputType.number,
                          obscureText: true,
                          maxLength: 3,
                          decoration: const InputDecoration(
                            counterText: "",
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                            labelText: "CVV",
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