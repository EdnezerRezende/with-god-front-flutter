import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

String convertToUppercase(String? valor) {
  // Converter qualquer string recebida para uppercase e devolver
  String? input = valor;
  if (input != null) {
    return input.toUpperCase();
  } else {
    return "";
  }
}

List<BooksByGrupoStruct>? classificarBooksByGrupo(
    List<BooksStruct>? listBooks) {
  if (listBooks == null || listBooks.isEmpty) return null;

  Map<String, List<BooksStruct>> groupedBooks = {};

  // Agrupar os livros por grupo
  for (var book in listBooks) {
    if (groupedBooks.containsKey(book.grupo)) {
      groupedBooks[book.grupo]!.add(book);
    } else {
      groupedBooks[book.grupo] = [book];
    }
  }

  // Converter o mapa em uma lista de BooksByGrupoStruct
  List<BooksByGrupoStruct> result = groupedBooks.entries.map((entry) {
    return BooksByGrupoStruct(
      grupo: entry.key,
      livros: entry.value,
    );
  }).toList();

  return result;
}

bool? filterBooksByGroupId(
  String? groupIdFilterFor,
  String? groupIdBookIn,
) {
  String groupIdAll = "9";
  if (groupIdFilterFor == groupIdAll) {
    return true;
  }
  return groupIdBookIn?.toLowerCase().contains(groupIdFilterFor!.toLowerCase());
}

List<BooksStruct>? filterListBooks(
  List<BooksStruct>? listBooks,
  String? groupIdFilter,
) {
  print(listBooks);
  print(groupIdFilter);
  if (listBooks == null || listBooks.isEmpty) {
    return listBooks;
  }

  if (groupIdFilter == null || groupIdFilter.isEmpty || groupIdFilter == "9") {
    return listBooks;
  }

  listBooks.forEach((element) {
    print(element);
    print(element.groupId == groupIdFilter);
  });
  List<BooksStruct> listReturn = listBooks
      .where((book) => book.groupId == int.parse(groupIdFilter))
      .toList();

  return listReturn;
}

String? convertIntegerForString(int? valueInt) {
  return valueInt!.toString();
}

int? convertStringForInteger(String? valueString) {
  if (valueString!.contains(",")) return 9;

  return int.parse(valueString);
}

DateTime stringToDate(String dateString) {
  return DateTime.parse(dateString);
}
