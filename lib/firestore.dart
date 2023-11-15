import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreService {
  // get collection of users
  final CollectionReference users = FirebaseFirestore.instance.collection('users');

  //CREATE: add a new user
  Future<void> addUser(String userName) {
    return users.add({
      'name': userName
    });
  }

  //UPDATE: update user
  Future<void> updateUser(String userID, String newName) {
    return users.doc(userID).update({
      'name': newName
    });
  }

  //GET: get a user
  Future<void> getUser(String user) {
    return users.add({

    });
  }

  //DELETE: delete a user
  Future<void> deleteUser(String user) {
    return users.add({

    });
  }
}