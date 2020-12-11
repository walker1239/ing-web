import 'package:flutter/material.dart';
import 'package:get/get.dart';

Map<String,String> lang=en;

Map<String,String> en={
  "lang":"en",
  "dashboard":"dashboard",
  "users":"users",
  "roles":"roles",
  "members":"members",
  "add":"add",
  "names":"names",
  "last_name":"last_name",
  "actions":"actions",
  "edit":"edit",
  "delete":"delete",
  "names_form_error":"please, fill your name",
  "last_name_form_error":"please, fill your last name",
  "save":"save",
};

Map<String,String> es={
  "lang":"es",
  "dashboard":"dashboard",
  "users":"usuarios",
  "roles":"roles",
  "members":"miembros",
  "add":"Añadir",
  "names":"Nombres",
  "last_name":"Apellidos",
  "actions":"Acciones",
  "edit":"Editar",
  "delete":"Eliminar",
  "names_form_error":"por favor, ingresa tus nombre",
  "last_name_form_error":"por favor, ingresa tus apellidos",
  "save":"guardar",
};

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          "lang":"en",
          "dashboard":"dashboard",
          "users":"users",
          "roles":"roles",
          "members":"members",
          "add":"add",
          "names":"names",
          "last_name":"last_name",
          "actions":"actions",
          "edit":"edit",
          "delete":"delete",
          "names_form_error":"please, fill your name",
          "last_name_form_error":"please, fill your last name",
          "save":"save",
          "email":"Email",
          "rol":"Rol",
          "active":"Active",
          "password":"Password"
        },
        'en_US': {
          'title': 'Hello World from US',
        },
        'es': {
          "lang":"es",
          "dashboard":"dashboard",
          "users":"usuarios",
          "roles":"roles",
          "members":"miembros",
          "add":"Añadir",
          "names":"Nombres",
          "last_name":"Apellidos",
          "actions":"Acciones",
          "edit":"Editar",
          "delete":"Eliminar",
          "names_form_error":"por favor, ingresa tus nombre",
          "last_name_form_error":"por favor, ingresa tus apellidos",
          "save":"guardar",
          "email":"Correo",
          "rol":"Rol",
          "active":"Activo",
          "password":"Contraseña",

        },
        'pt_BR': {
          'title': 'Olá do Brasil',
        },
      };
}