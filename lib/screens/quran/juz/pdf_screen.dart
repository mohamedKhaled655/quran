import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';


class PdfScreen extends StatefulWidget {
 
final int num;
 const PdfScreen({Key? key,  this.num=0}) : super(key: key);

  @override
  _PdfScreenState createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> with WidgetsBindingObserver {

  final Completer<PDFViewController> _controller =
  Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';
String pathPDF = "";
 Future<File> fromAsset(String asset, String filename) async {
    Completer<File> completer = Completer();
    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }



@override
  void initState() {
    // TODO: implement initState
    super.initState();
     
     fromAsset('assets/pdf/quran.pdf', 'quran.pdf').then((f) {
      setState(() {
        pathPDF = f.path;
      });
    });
  }




  @override
  Widget build(BuildContext context) {
   int name= widget.num;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:const Text("Quran"),
        actions: <Widget>[
          FutureBuilder<PDFViewController>(
            future: _controller.future,
            builder: (context, AsyncSnapshot<PDFViewController> snapshot) {
              if (snapshot.hasData) {
                return IconButton(
                  icon:const Icon(Icons.share),
                  onPressed: () async {
                    await snapshot.data!.setPage(0);
                   
                  },
                );
              }

              return Container();
            },
          ),
        
        ],
      ),
      body: Builder(
        builder: (context) {
          return (pathPDF.isNotEmpty)?Stack(
          
          children: <Widget>[


          PDFView(
          
            filePath: pathPDF,
            enableSwipe: true,
            fitEachPage: true,
            autoSpacing: true,
            pageFling: true,
            pageSnap: true,
            defaultPage:name ,
            fitPolicy: FitPolicy.HEIGHT,
          
            preventLinkNavigation:
            false, // if set to true the link is handled in flutter
            onRender: (_pages) {
              setState(() {
                pages = _pages;
                isReady = true;
              });
            },
            onError: (error) {
              setState(() {
                errorMessage = error.toString();
              });
              print(error.toString());
            },
            onPageError: (page, error) {
              setState(() {
                errorMessage = '$page: ${error.toString()}';
              });
              print('$page: ${error.toString()}');
            },
            onViewCreated: (PDFViewController pdfViewController) {
              _controller.complete(pdfViewController);
              
            },
            onLinkHandler: (String? uri) {
              print('goto uri: $uri');
            },
            onPageChanged: (int? page, int? total) {
               print('page change: $page/$total');
              setState(() {
                currentPage = page;
              });
            },
          ),
            errorMessage.isEmpty
                ? !isReady
                ? Center(
              child: CircularProgressIndicator(),
            )
                : Container()
                : Center(
              child: Text(errorMessage),
            )
          ],
        ):const Center(child: CircularProgressIndicator());
        },
       
      ),
      floatingActionButton: FutureBuilder<PDFViewController>(
        future: _controller.future,
        builder: (context, AsyncSnapshot<PDFViewController> snapshot) {
          if (snapshot.hasData) {
            return FloatingActionButton.extended(
              label: Text("Go to ${pages! ~/ 2}"),
              onPressed: () async {
                await snapshot.data!.setPage(pages! ~/ 2);
                
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}