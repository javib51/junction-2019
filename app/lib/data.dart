class DataStore {
 // your variables
  int sus_value = -1;
  int he_value = -1;
  int sav_value = -1;
  static final DataStore instance = new DataStore._internal();

  factory DataStore() {
    return instance;
  }

  DataStore._internal();
}