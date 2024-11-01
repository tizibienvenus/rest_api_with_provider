
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_with_provider/core/res/base.dart';

class Endpoints {
  static const baseUrl = BasePath.baseUrl;

  // Post
  static const getAllUsers = '$baseUrl/Users';
}

class NetworkUtility {
  static const Map<String, String> defaultHeaders = {
    "Content-Type": "application/json"
  };
  static const int requestTimeout = 10; // Timeout en secondes

  // Méthode GET avec timeout et gestion d'erreurs
  static Future<String?> fetch(Uri uri, {Map<String, String>? headers}) async {
    final client = http.Client();
    try {
      final response = await client
          .get(uri, headers: headers ?? defaultHeaders)
          .timeout(Duration(seconds: requestTimeout));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        debugPrint("Erreur GET ${response.statusCode}: ${response.body}");
        return "Erreur: ${response.statusCode}";
      }
    } catch (e) {
      debugPrint("Exception GET: ${e.toString()}");
      return "Exception: ${e.toString()}";
    } finally {
      client.close();
    }
  }

  // Méthode POST avec timeout et gestion d'erreurs
  static Future<String?> post(Uri uri,
      {Map<String, String>? headers, Map<String, dynamic>? body}) async {
    final client = http.Client();
    try {
      final response = await client
          .post(
            uri,
            headers: headers ?? defaultHeaders,
            body: body != null ? jsonEncode(body) : null,
          )
          .timeout(Duration(seconds: requestTimeout));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        debugPrint("Erreur POST ${response.statusCode}: ${response.body}");
        return "Erreur: ${response.statusCode}";
      }
    } catch (e) {
      debugPrint("Exception POST: ${e.toString()}");
      return "Exception: ${e.toString()}";
    } finally {
      client.close();
    }
  }

  // Méthode DELETE avec timeout et gestion d'erreurs
  static Future<String?> delete(Uri uri, {Map<String, String>? headers}) async {
    final client = http.Client();
    try {
      final response = await client
          .delete(uri, headers: headers ?? defaultHeaders)
          .timeout(Duration(seconds: requestTimeout));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        debugPrint("Erreur DELETE ${response.statusCode}: ${response.body}");
        return "Erreur: ${response.statusCode}";
      }
    } catch (e) {
      debugPrint("Exception DELETE: ${e.toString()}");
      return "Exception: ${e.toString()}";
    } finally {
      client.close();
    }
  }

  // Méthode PUT avec timeout et gestion d'erreurs
  static Future<String?> put(Uri uri,
      {Map<String, String>? headers, Map<String, dynamic>? body}) async {
    final client = http.Client();
    try {
      final response = await client
          .put(
            uri,
            headers: headers ?? defaultHeaders,
            body: body != null ? jsonEncode(body) : null,
          )
          .timeout(Duration(seconds: requestTimeout));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        debugPrint("Erreur PUT ${response.statusCode}: ${response.body}");
        return "Erreur: ${response.statusCode}";
      }
    } catch (e) {
      debugPrint("Exception PUT: ${e.toString()}");
      return "Exception: ${e.toString()}";
    } finally {
      client.close();
    }
  }
}

/*
class NetworkUtility {
  static const Map<String, String> defaultHeaders = {
    "Content-Type": "application/json"
  };

  // Méthode pour les requêtes GET
  static Future<String?> fetch(Uri uri, {Map<String, String>? headers}) async {
    try {
      final response = await http.get(uri, headers: headers ?? defaultHeaders);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        debugPrint("Erreur GET ${response.statusCode}: ${response.body}");
      }
    } catch (e) {
      debugPrint("Exception GET: ${e.toString()}");
    }
    return null;
  }

  // Méthode pour les requêtes POST
  static Future<String?> post(Uri uri, {Map<String, String>? headers, Map<String, dynamic>? body}) async {
    try {
      final response = await http.post(
        uri,
        headers: headers ?? defaultHeaders,
        body: body != null ? jsonEncode(body) : null,
      );
      if (response.statusCode == 200) {
        return response.body;
      } else {
        debugPrint("Erreur POST ${response.statusCode}: ${response.body}");
      }
    } catch (e) {
      debugPrint("Exception POST: ${e.toString()}");
    }
    return null;
  }

  // Méthode pour les requêtes DELETE
  static Future<String?> delete(Uri uri, {Map<String, String>? headers}) async {
    try {
      final response = await http.delete(uri, headers: headers ?? defaultHeaders);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        debugPrint("Erreur DELETE ${response.statusCode}: ${response.body}");
      }
    } catch (e) {
      debugPrint("Exception DELETE: ${e.toString()}");
    }
    return null;
  }
}
*/
