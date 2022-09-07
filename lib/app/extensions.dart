// extension on string

const String EMPTY = "";
extension NonNullString on String?{
  String orEmpty(){
    if(this == null){
      return EMPTY;
    }else {
      return this!;
    }
  }
}

// extension on int
int ZERO = 0;
extension NonNullInt on int?{
  int orZero(){
    if(this == null){
      return ZERO;
    }else {
      return this!;
    }
  }
}
