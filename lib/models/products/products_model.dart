import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prueba_mvc/models/products/members.dart';

enum ProductsModelStatus {
  Ended,
  Loading,
  Error,
}

class ProductsModel extends ChangeNotifier {
  ProductsModelStatus _status;
  String _errorCode;
  String _errorMessage;
  
  List <Members> _integrantes= [];
  List<Members> get integrantes => _integrantes;

  String get errorCode => _errorCode;
  String get errorMessage => _errorMessage;
  ProductsModelStatus get status => _status;

  ProductsModel();

  ProductsModel.instance() {
    //TODO Add code here
  }
  
  Future<void> getter() async {
    _status = ProductsModelStatus.Loading;
    notifyListeners();
    
   Query query =FirebaseFirestore.instance.collection('integrantes');
    print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    var result = await query.get();
    
    _integrantes = result.docs
        .map((doc) => Members.fromMap(doc.data(), doc.id))
        .toList();
    print(_integrantes[0].nombres);
    /*await query.get().then((querySnapshot) async {
      querySnapshot.docs.forEach((document) {
        print(document);
        print("c");
        print(document.reference);
      });


    });*/
    print("bbbbbbbbbbbbbbbb");
    _status = ProductsModelStatus.Ended;
    notifyListeners();
  }

  void setter(Members miembro) {
    _status = ProductsModelStatus.Loading;
    notifyListeners();

    FirebaseFirestore.instance.collection('integrantes').add(miembro.toJson());
    _status = ProductsModelStatus.Ended;
    notifyListeners();
  }

  void update(Members miembro) {
    _status = ProductsModelStatus.Loading;
    notifyListeners();
    print("updateeeeeeeeee");
    print(miembro.id);
    FirebaseFirestore.instance.collection('integrantes').doc(miembro.id).update(miembro.toJson());
    //TODO Add code here
    
    _status = ProductsModelStatus.Ended;
    notifyListeners();
  }

  void remove(Members miembro) {
    _status = ProductsModelStatus.Loading;
    notifyListeners();

    FirebaseFirestore.instance.collection('integrantes').doc(miembro.id).delete();
  
    
    _status = ProductsModelStatus.Ended;
    notifyListeners();
  }
}