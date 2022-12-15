import 'dart:async';
import 'package:flutter/material.dart';

class Employee {
  int _id;
  String _name;
  double _salary;

  Employee(this._id, this._name, this._salary);

  //Getters

  int get getId => _id;
  String get getName {
    return _name;
  }

  double get getSalary => _salary;

  //Setters

  set setId(int id) {
    _id = id;
  }

  set setName(String name) {
    _name = name;
  }

  set setSalary(double salary) {
    _salary = salary;
  }
}
