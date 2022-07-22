import 'dart:convert';
import 'dart:io';

import 'package:spedisci_e_vai/main.dart';

import 'error.dart';
import 'new_delivery/conferm_delivery.dart';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class DetailDerivery extends StatefulWidget {

  int deriveryId;

  DetailDerivery(this.deriveryId, {Key? key}) : super(key: key);
  List<TextEditingController> formController=List.generate(20, (index)=>TextEditingController());
  
  @override
  State<DetailDerivery> createState() => _DetailDeriveryState();
}

class _DetailDeriveryState extends State<DetailDerivery>{

  int state=0;
  late Map<String, dynamic> derivery;

  @override
  void initState() {
    super.initState();
    http.post(Uri.parse("https://theandredroid.altervista.org/spediscievai/query.php"),
      body: {
        "query": "SELECT * FROM spediscievai_ordini WHERE ID=?",
        "parameters": json.encode([widget.deriveryId])
      }
    ).then((response){
      try{
        Map<String, dynamic> responseJson = json.decode(response.body);
        print(responseJson);
        derivery=responseJson["results"][0];
        setState(() {
          state=1;
        });
      } catch (e) {
        print(e);
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Error()) , (route) => route.isFirst);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case 0:
        return Scaffold(
          body: Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        );
      default:
      return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: MediaQuery.of(context).size.width>maxWidth+150?
                  EdgeInsets.only(left:(MediaQuery.of(context).size.width-maxWidth)/2):
                  null,
                title: Text('Dettagli ordine: ${derivery['ID']}',
                  style: TextStyle(
                    color: Colors.black,
                  )
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: SizedBox(
                  width: maxWidth,
                  child: Container(
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height - 86
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          CategoryTitleWidget("Mittente"),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              SubTitleWidget("Cognome e nome"),
                              Expanded(child: Container()),
                              InformationContentWidget("${derivery["mittente_cognome"]} ${derivery["mittente_nome"]}"),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              SubTitleWidget("Indirizzo"),
                              Expanded(child: Container()),
                              InformationContentWidget("${derivery["mittente_indirizzo"]} n.${derivery["mittente_civico"]}, ${derivery["mittente_citta"]} ${derivery["mittente_cap"]} (${derivery["mittente_provincia"]})"),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CategoryTitleWidget("Destinatario"),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              SubTitleWidget("Cognome e nome"),
                              Expanded(child: Container()),
                              InformationContentWidget("${derivery["destinatario_cognome"]} ${derivery["destinatario_nome"]}"),
                            ],
                          ),const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              SubTitleWidget("Indirizzo"),
                              Expanded(child: Container()),
                              InformationContentWidget("${derivery["destinatario_indirizzo"]} n.${derivery["destinatario_civico"]}, ${derivery["destinatario_citta"]} ${derivery["destinatario_cap"]} (${derivery["destinatario_provincia"]})"),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CategoryTitleWidget("Pagamento"),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              SubTitleWidget("Intestatario"),
                              Expanded(child: Container()),
                              InformationContentWidget("${derivery["pagamento_cognome"]} ${derivery["pagamento_nome"]}"),
                            ],
                          ),const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              SubTitleWidget("Numeo carta"),
                              Expanded(child: Container()),
                              InformationContentWidget("${derivery["carta"]}"),
                            ],
                          ), 
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              SubTitleWidget("Scadenza"),
                              Expanded(child: Container()),
                              InformationContentWidget("${derivery["scadenza_mese"]}/${derivery["scadenza_anno"]}"),
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
              ),
            ),
          ]
        ),
      );
    }
  }
}