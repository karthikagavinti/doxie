// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

// class MyPdfViewer extends StatelessWidget {
//   final Future<PDFDocument> pdfFuture; // A Future that resolves to PDFDocument



//   if (snapshot.connectionState == ConnectionState.done) {
//   if (snapshot.hasError) {
//     return Text('Error loading PDF: ${snapshot.error}');
//   }
//   final pdfDocument = snapshot.data;
//   if (pdfDocument != null) {
//     return PDFViewer(document: pdfDocument);
//   } else {
//     return Text('PDF is null'); // Handle null case
//   }
// } else {
//   return CircularProgressIndicator(); // Show loading indicator
// }

// final pdfDocument = snapshot.data!;
//   MyPdfViewer(this.pdfFuture);

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<PDFDocument>(
//       future: pdfFuture,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           if (snapshot.hasError) {
//             return Text('Error loading PDF: ${snapshot.error}');
//           }
//           final pdfDocument = snapshot.data;
//           return PDFViewer(document: pdfDocument);
//         } else {
//           return CircularProgressIndicator(); // Show loading indicator
//         }
//       },
//     );
//   }
// }
