import 'package:flutter/material.dart';

abstract class EventLogin {
  TextEditingController? emailC;
  TextEditingController? passC;
  EventLogin(this.emailC, this.passC);
}

class EventLoginEx extends EventLogin {
  EventLoginEx(super.emailC, super.passC);
}
