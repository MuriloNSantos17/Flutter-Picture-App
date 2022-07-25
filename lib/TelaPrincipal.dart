import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {

  File? image;

  Future pickImage() async{
    try{
      print('entrei');
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;

      final imageTemporary = File(image.path);

      setState(()=>this.image = imageTemporary);
    } on PlatformException catch(e){
      print('fail: ${e}');
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          image!=null ? Image.file(image!,width: 500,height: 500,): FlutterLogo(size: 160),
          ElevatedButton(

            child: Text("Galeria"),
            onPressed: (){
              pickImage();
            },
          )

        ],
      ),
    );
  }
}
