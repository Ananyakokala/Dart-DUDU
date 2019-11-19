import 'dart:collection';
import 'dart:io';
int x = 0;
main(){
  Map <int, List> person = Map();
  String userOption;
  while(userOption != 'e'){
    print('Please Select your choice:\n');
    print('a. Add a new person\n b. Update the person details\nc. Delete a person details\nd. Displayy all person details\ne. Exit\n');
    userOption = stdin.readLineSync();

    // Define the Hashmap for the person.
    helpUser(userOption, person);
  }
}

  // User operation handler
  helpUser(option, personMap){
    switch (option){
      // Add new user.
      case 'a': {
                  addPerson(personMap);
                  break;
                }
      case 'b': {
                  displayTheExistingUser(personMap);
                  var person = stdin.readLineSync();
                  editPerson(int.parse(person), personMap);
                  break;
                }
      case 'c': {
                  displayTheExistingUser(personMap);
                  var personDelete = stdin.readLineSync();
                  deletePerson(int.parse(personDelete), personMap);
                  break;
                }
      case 'd': {
                  display(personMap);
                  break;
                }
      case 'e': {
                  print('Bye Dudu!!');
                  break;
                }
      case 'f': return;
      default: print('Wrong choice DUDU!!. Sorry!!');
    }
  }

  // Deplay the peron name.
  displayTheExistingUser(personMap){
    personMap.forEach((key, value) => print("$key => $value"));
  }

  //Add person
  addPerson(personMap){
    print("Name: ");
    String name = stdin.readLineSync();
    print("DOB: ");
    String dob = stdin.readLineSync();
    print("City: ");
    String city = stdin.readLineSync();

    // Set the person hashmap data.
    personMap[x] = new List(3);
    personMap[x][0] = name;
    personMap[x][1] = dob;
    personMap[x][2] = city;
    x++;
  }

  display(personMap) {
    personMap.forEach((key, value) => print("$key = $value"));
  }

  editPerson(person, personMap){
    if(personMap.containsKey(person)) {
      print("Name: ");
      String name = stdin.readLineSync();
      print("DOB: ");
      String dob = stdin.readLineSync();
      print("City: ");
      String city = stdin.readLineSync();

      // Set the person hashmap data.
      personMap[person][0] = name;
      personMap[person][1] = dob;
      personMap[person][2] = city;
    }else{
      print('selected key not found');
    }
  }

  deletePerson(personDelete, personMap){
    if(personMap.containsKey(personDelete)) {
      personMap.remove(personDelete);
    }else {
      print('Select the invalid key');
    }
  }
