import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension Nav on BuildContext {
  //_______________________ push page extention ______________________
  push({required Widget view}) {
    Navigator.push(this, MaterialPageRoute(builder: (context) => view));
  }

  //_______________________ push and remove page extention ______________________
  pushAndRemove({required Widget view}) {
    Navigator.pushAndRemoveUntil(
        this, MaterialPageRoute(builder: (context) => view), (route) => false);
  }

  //_______________________ pop page extention ______________________
  pop({required Widget view}) {
    Navigator.pop(this, MaterialPageRoute(builder: (context) => view));
  }
    //_______________________ push and remove page extention ______________________
  pushAndRemoveCup({required Widget view}) {
    Navigator.pushReplacement(
        this, CupertinoPageRoute(builder: (context) => view),);
  }

}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// extension Nav on BuildContext {
//   //_______________________ push page extention ______________________
//   push({required Widget view}) {
//     Navigator.push(this, MaterialPageRoute(builder: (context) => view));
//   }


//   //_______________________ pop page extention ______________________
//   pop({required Widget view}) {
//     Navigator.pop(this, MaterialPageRoute(builder: (context) => view));
//   }
// }

