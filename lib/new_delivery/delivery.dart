import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:spedisci_e_vai/detail_derivery.dart';
import 'package:spedisci_e_vai/main.dart';
import 'package:spedisci_e_vai/new_delivery/payment_details.dart';
import 'package:spedisci_e_vai/new_delivery/recipient_details.dart';
import 'package:spedisci_e_vai/new_delivery/sender_details.dart';
import '../error.dart';
import 'package:http/http.dart' as http;
//import 'dart:js' as js;


import 'conferm_delivery.dart';

class Delivery extends StatefulWidget {
  Delivery({Key? key}) : super(key: key);
  List<TextEditingController> formController=List.generate(20, (index)=>TextEditingController());
  
  @override
  State<Delivery> createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery>{

  int _index=0;

  Widget _pagechoiser(int index){
    switch (index) {
      case 3:
        return ConfirmDelivery(widget.formController);
      case 2:
        return PaymentDetails(widget.formController);
      case 1:
          return RecipientDetails(widget.formController);
      default:
        return SenderDetails(widget.formController);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pagechoiser(_index),
      bottomNavigationBar: DeliveryNavigationBar( widget.formController,
        onDestinationSelected: (index){
          setState(() {
            _index=index;
          });
        },
      )
    );
  }
}


class DeliveryNavigationBar  extends StatefulWidget{

  List<TextEditingController> formController;

  DeliveryNavigationBar(this.formController, {
    Key? key,
    this.onDestinationSelected,
  }):super(key: key);

  void Function(int)? onDestinationSelected;
  
  @override
  State<StatefulWidget> createState() => _DeliveryNavigationBarState();
}

class _DeliveryNavigationBarState extends State<DeliveryNavigationBar>{
  
  int _orderState=0;
  int _selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    switch (_orderState) {
      case 3:
        return SizedBox(
          child: NavigationBar(
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            selectedIndex: _selectedIndex,
            onDestinationSelected: (index) async {
              if(index==4) {
                Map<String, dynamic> response = json.decode((await http.post(Uri.parse("https://theandredroid.altervista.org/spediscievai/query.php"),
                  body: {
                    "query": "INSERT INTO `my_theandredroid`.`spediscievai_ordini` (`mittente_cognome`, `mittente_nome`, `mittente_citta`, `mittente_cap`, `mittente_provincia`, `mittente_indirizzo`, `mittente_civico`, `destinatario_cognome`, `destinatario_nome`, `destinatario_citta`, `destinatario_cap`, `destinatario_provincia`, `destinatario_indirizzo`, `destinatario_civico`, `pagamento_cognome`, `pagamento_nome`, `carta`, `scadenza_mese`, `scadenza_anno`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
                    "parameters": json.encode([widget.formController[0].text, widget.formController[1].text, widget.formController[2].text, widget.formController[3].text, widget.formController[4].text, widget.formController[5].text, widget.formController[6].text, widget.formController[7].text, widget.formController[8].text, widget.formController[9].text, widget.formController[10].text, widget.formController[11].text, widget.formController[12].text, widget.formController[13].text, widget.formController[14].text, widget.formController[15].text, widget.formController[16].text, widget.formController[17].text, widget.formController[18].text]),
                  }
                )).body);
                if (response.containsKey("error") && response["error"]==true){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Error()), (route) => route.isFirst);
                }else if (response.containsKey("results")) {
                  Navigator.pushAndRemoveUntil(context, PageRouteBuilder(
                    pageBuilder: (context, _, __){
                      http.post(Uri.parse("https://theandredroid.altervista.org/spediscievai/query.php"),
                        body: {
                          "query": "SELECT MAX(ID) FROM spediscievai_ordini"
                        }
                      ).then((response){
                        try{
                          Map<String, dynamic> responseJson = json.decode(response.body);
                          print(responseJson);
                          Map<String, dynamic> derivery=responseJson["results"][0];
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => DetailDerivery(int.parse(derivery['MAX(ID)']))), (route) => route.isFirst);
                        } catch (e) {
                          print(e);
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Error()) , (route) => route.isFirst);
                        }
                      });
                      return Scaffold(
                        body: Container(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      );
                    }
                  ), (route) => route.isFirst);
                }
                return;
              }
              _selectedIndex=index;
              widget.onDestinationSelected!(index);
            },
            destinations: const [
              NavigationDestination(
                tooltip: "",
                icon: Icon(Icons.looks_one_outlined),
                label: '',
                selectedIcon: Icon(Icons.looks_one),
              ),
              NavigationDestination(
                tooltip: "",
                icon: Icon(Icons.looks_two_outlined),
                label: '',
                selectedIcon: Icon(Icons.looks_two),
              ),
              NavigationDestination(
                tooltip: "",
                icon: Icon(Icons.looks_3_outlined),
                label: '',
                selectedIcon: Icon(Icons.looks_3),
              ),
              NavigationDestination(
                tooltip: "",
                icon: Icon(Icons.looks_4_outlined),
                label: '',
                selectedIcon: Icon(Icons.looks_4),
              ),
              NavigationDestination(
                tooltip: "",
                icon: Icon(Icons.done),
                label: '',
              ),
            ]
          ),
        );
      case 2:
        return NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          selectedIndex: _selectedIndex,
          onDestinationSelected: (index) {
            if(index==3) {
              setState(() {
                _orderState=index;
              });
            }
            _selectedIndex=index;
            widget.onDestinationSelected!(index);
          },
          destinations: const [
            NavigationDestination(
              tooltip: "",
              icon: Icon(Icons.looks_one_outlined),
              label: '',
              selectedIcon: Icon(Icons.looks_one),
            ),
            NavigationDestination(
              tooltip: "",
              icon: Icon(Icons.looks_two_outlined),
              label: '',
              selectedIcon: Icon(Icons.looks_two),
            ),
            NavigationDestination(
              tooltip: "",
              icon: Icon(Icons.looks_3_outlined),
              label: '',
              selectedIcon: Icon(Icons.looks_3),
            ),
            NavigationDestination(
              tooltip: "",
              icon: Icon(Icons.navigate_next_rounded),
              label: '',
            ),
          ]
        );
      case 1:
        return NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          selectedIndex: _selectedIndex,
          onDestinationSelected: (index) {
            if(index==2) {
              setState(() {
                _orderState=index;
              });
            }
            _selectedIndex=index;
            widget.onDestinationSelected!(index);
          },
          destinations: const [
            NavigationDestination(
              tooltip: "",
              icon: Icon(Icons.looks_one_outlined),
              label: '',
              selectedIcon: Icon(Icons.looks_one),
            ),
            NavigationDestination(
              tooltip: "",
              icon: Icon(Icons.looks_two_outlined),
              label: '',
              selectedIcon: Icon(Icons.looks_two),
            ),
            NavigationDestination(
              tooltip: "",
              icon: Icon(Icons.navigate_next_rounded),
              label: '',
            ),
          ]
        );
      default:
        return NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          selectedIndex: _selectedIndex,
          onDestinationSelected: (index) {
            if(index==1) {
              setState(() {
                _orderState=index;
              });
            }
            _selectedIndex=index;
            widget.onDestinationSelected!(index);
          },
          destinations: const [
            NavigationDestination(
              tooltip: "",
              icon: Icon(Icons.looks_one_outlined),
              label: '',
              selectedIcon: Icon(Icons.looks_one),
            ),
            NavigationDestination(
              tooltip: "",
              icon: Icon(Icons.navigate_next_rounded),
              label: '',
            ),
          ]
        );
    }
  }
}