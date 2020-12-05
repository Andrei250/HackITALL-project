
class Person {
    String firstName;
    String lastName;
    String department;
    String name;
    String uid;

    Person({this.firstName, this.lastName, this.department, this.name, this.uid});

  @override
  String toString() {
    return firstName + " " + lastName + " " + name + " " + uid + " " + department;
  }
}