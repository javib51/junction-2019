class DataStore {
 // your variables
  int sus_value = -1;
  int he_value = -1;
  int sav_value = -1;

  bool swi_stra = false;
  bool resell_stra = false;
  bool invest_stra = false;
  bool auto_stra = false;
  bool cut_stra = false;

  static final DataStore instance = new DataStore._internal();

  factory DataStore() {
    return instance;
  }

  DataStore._internal();
}