import 'package:flutter/material.dart';

 class Consts {
 Consts._();

 static const double padding = 10;
 static const double avatarRadius = 60;
 }

 class WarningDialog extends StatelessWidget {
 final String? description;
 final VoidCallback? okClick;

 const WarningDialog({Key? key, this.description, this.okClick})
 : super(key: key);

@override
 Widget build(BuildContext context) {
 return Dialog(
 shape: RoundedRectangleBorder(
 borderRadius: BorderRadius.circular(Consts.padding)),
 elevation: 0,
 backgroundColor: Colors.transparent,
 child: dialogContent(context),
 );
 }

 dialogContent(BuildContext context) {
 return Container(
 padding: const EdgeInsets.only(
 top: Consts.padding,
 bottom: Consts.padding,
 left: Consts.padding,
 right: Consts.padding,
 ),
 margin: const EdgeInsets.only(top: Consts.avatarRadius),
 decoration: BoxDecoration(
 color: Colors.white,
 shape: BoxShape.rectangle,
 borderRadius: BorderRadius.circular(Consts.padding),
 boxShadow: const [
 BoxShadow(
 color: Colors.black26,
 blurRadius: 10,
 offset: Offset(0, 10),
 ),
 ],
 ),
 child: Column(
 mainAxisSize: MainAxisSize.min,
 children: [
 const Text(
 "GAGAL",
 style: TextStyle(
 fontSize: 20, fontWeight: FontWeight.w700, color: Colors.red),
 ),
 const SizedBox(height: 10),
 Text(
 description!,
 textAlign: TextAlign.center,
 style: const TextStyle(
 fontSize: 10,
 ),
 ),
 const SizedBox(height: 20),
 Align(
 alignment: Alignment.bottomRight,
 child: ElevatedButton(
 onPressed: () {
 Navigator.of(context).pop(); // To close the dialog
 okClick!();
 },
 child: const Text("OK"),
 ),
 )
 ],
 ),
 );
 }
 }