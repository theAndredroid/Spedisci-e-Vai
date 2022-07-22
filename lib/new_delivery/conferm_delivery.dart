import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:spedisci_e_vai/main.dart';

class ConfirmDelivery extends StatefulWidget {
  List<TextEditingController> formController;

  ConfirmDelivery(this.formController, {Key? key}) : super(key: key);
  
  @override
  State<ConfirmDelivery> createState() => _ConfirmDeliveryState();



}

class _ConfirmDeliveryState extends State<ConfirmDelivery>{
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
            title: Text('Conferma spedizione',
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
                        InformationContentWidget("${widget.formController[0].text} ${widget.formController[1].text}"),
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
                        InformationContentWidget("${widget.formController[5].text} n.${widget.formController[6].text}, ${widget.formController[2].text} ${widget.formController[3].text} (${widget.formController[4].text})"),
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
                        InformationContentWidget("${widget.formController[7].text} ${widget.formController[8].text}"),
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
                        InformationContentWidget("${widget.formController[12].text} n.${widget.formController[13].text}, ${widget.formController[9].text} ${widget.formController[10].text} (${widget.formController[11].text})"),
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
                        InformationContentWidget("${widget.formController[14].text} ${widget.formController[15].text}"),
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
                        InformationContentWidget("${widget.formController[16].text}"),
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
                        InformationContentWidget("${widget.formController[17].text}/${widget.formController[18].text}"),
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
      ],
    );
  }
}

class CategoryTitleWidget extends StatefulWidget{
  String title;
  CategoryTitleWidget(this.title, {Key? key}):super(key: key);

  @override
  State<CategoryTitleWidget> createState() => _CategoryTitleState();
}

class _CategoryTitleState extends State<CategoryTitleWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${widget.title}:',
          style: TextStyle(
            fontSize: 25*MediaQuery.of(context).textScaleFactor,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        SizedBox(
          height: 1,
          child: Container(
            color: Theme.of(context).colorScheme.tertiary,
          ),
        )
      ]
    );
  }
}

class SubTitleWidget extends StatefulWidget{

  String title;
  SubTitleWidget(this.title, {Key? key}):super(key: key);

  @override
  State<SubTitleWidget> createState() => _SubTitleWidgetState();
}

class _SubTitleWidgetState extends State<SubTitleWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      '${widget.title}:',
      style: TextStyle(
        fontSize: 16*MediaQuery.of(context).textScaleFactor,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.secondary
      ),
    );
  }
}

class InformationContentWidget extends StatefulWidget{
  String title;

  InformationContentWidget(this.title, {Key? key}) : super(key: key);
  
  @override
  State<InformationContentWidget> createState() => _InformationContentWidgetState();
}

class _InformationContentWidgetState extends State<InformationContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: const TextStyle(
        fontStyle: FontStyle.italic
      ),
    );
  }}