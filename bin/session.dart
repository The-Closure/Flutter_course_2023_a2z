import 'dart:convert';

void main(List<String> arguments) async {
//   int x = 3;
//   double y =4.6;
//   String name = "ahmad";
//   bool logic;

// print(x);
// print(y);
// print(name);

// // ! added in dart

// num newvarible = 3;

// var test = "ahmad";

// print(test);

// // test = 3;

// // ? helpint more dynamic

// dynamic test1 = "ahmad";

// print(test1);

// test1 = 3;

// print(test1);

// non-premitive

// List<String> mylist= [1,2,3,"name",true];
//   List mylist2 = [];

// // mylist.forEach((element) {mylist2.add(element); });

//   print(mylist2);

//   Map<String, dynamic> mymap = {"name": "ahmad", "age": 13, "gender": "male"};

//     print(mymap.toString());
//   // print(mymap);
// // mymap.containsValue(13);

//   print(mymap[2]);

  // Map<List<String>, dynamic> nestList = {
  //   ["ahmad", "yaser", "noor"]: 14,
  //   ["noor", "gaith", "abd"]: 20
  // };
  Future.delayed(
    Duration(milliseconds: 1),
    () {
      Animals katy =  Cat(name: "katy", position: 0);

      katy.helpingMethod();
    },
  );

  funcAsyc() async {
    return 3;
  }

  int x = await  funcAsyc();

  print(x);

  // print(nestList.values.elementAt(1));

  // List<Map<String, List>> nestMap = [
  //   {
  //     "student": ["ahmad", "yaser", "abd"]
  //   },
  //   {
  //     "marks": [14, 20, 59]
  //   }
  // ];

  // nestMap[1]['marks']!.elementAt(2);

  // print(nestMap[1]['marks']!.elementAt(2));

  //   func1(String schoolName ,{int countOfStudent =30,required int numberOfChairs}){
  //     print(countOfStudent);

  //     return (countOfStudent >= numberOfChairs) ? true : false;
  //   }

  //  print(func1('Alawael',countOfStudent: 33,numberOfChairs: 35));

  //     bool? monsterOfNull =true;

//   //     print(monsterOfNull.runtimeType);

//   const int numberOfPeople = 3;

//   final int numberOfPeople1;

//   numberOfPeople1 =3;

//   print(numberOfPeople1);

//   print(numberOfPeople);

// const x =3;

// final y =3;
}

abstract class Animals {
  String name;
  int position;
  Animals({
    required this.name,
    required this.position,
  });

  helpingMethod();

  moveUp() {
    position = position + 1;
  }

  moveDown() {
    position = position - 1;
  }

  moveVertical(String direction) {
    if (direction == 'w') {
      position++;
    } else {
      position--;
    }
  }
}

class Cat extends Animals {
  Cat({required super.name, required super.position});

  @override
  moveUp() {
    return super.moveUp();
  }

  @override
  helpingMethod() {
    print("hello");
  }
}

class Dog extends Animals {
  Dog({required super.name, required super.position});

  @override
  helpingMethod() {
    // TODO: implement helpingMethod
    throw UnimplementedError();
  }
}
