//TODO:STEP1-import
import 'dart:async';
import 'package:employee_bloc/Models/employee.dart';

class EmployeeBloc {
  //TODO: Step 2- create a list

  final List<Employee> _employeeList = [
    Employee(1, "One", 1000.0),
    Employee(2, "Two", 2000.0),
    Employee(3, "Three", 3000.0),
    Employee(4, "Four", 4000.0),
    Employee(5, "Five", 5000.0),
    Employee(6, "Six", 6000.0),
  ];

  //TODO:Step 3- StreamControllers

  final _empListStreamController = StreamController<List<Employee>>();
  final _empIncrementStreamController = StreamController<Employee>();
  final _empDecrementStreamController = StreamController<Employee>();

  //TODO: Step 4- Getters for stream Contollers
  Stream<List<Employee>> get getEmployeeListStream =>
      _empListStreamController.stream;

  StreamSink<List<Employee>> get getEmployeeListSink =>
      _empListStreamController.sink;

  StreamSink<Employee> get getIncrementStream =>
      _empIncrementStreamController.sink;

  StreamSink<Employee> get getDecrementStream =>
      _empDecrementStreamController.sink;

  //TODO:Step:5 Create Conctructor-Add Data -Listen

  EmployeeBloc() {
    _empListStreamController.add(_employeeList);
    _empIncrementStreamController.stream.listen(_incrementSalary);
    _empDecrementStreamController.stream.listen(_decrementSalary);
  }

  //TODO:Step 6- Core Functions
  _incrementSalary(Employee employee) {
    double salary = employee.getSalary;

    double incremeentedSalary = salary * 20 / 100;

    _employeeList[employee.getId - 1].setSalary = salary + incremeentedSalary;

    getEmployeeListSink.add(_employeeList);
  }

  _decrementSalary(Employee employee) {
    double salary = employee.getSalary;

    double decremeentedSalary = salary * 20 / 100;

    _employeeList[employee.getId - 1].setSalary = salary - decremeentedSalary;

    getEmployeeListSink.add(_employeeList);
  }

  //TODO: step 7 -Dispose Streams

  void dispose() {
    _empListStreamController.close();
    _empIncrementStreamController.close();
    _empDecrementStreamController.close();
  }
}
