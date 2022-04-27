enum DisbursmentIntervalType { Daily, Weekly, Monthly, Unexpected, Emergency }

class MainUtility {
  static bool isDisbursmentMatchWith(
      String value, DisbursmentIntervalType target) {
    if (convertDisbursmentEnum(value) == target) {
      return true;
    }
    return false;
  }

  static DisbursmentIntervalType convertDisbursmentEnum(String type) {
    switch (type) {
      case "Harian":
        return DisbursmentIntervalType.Daily;
      case "Mingguan":
        return DisbursmentIntervalType.Weekly;
      case "Bulanan":
        return DisbursmentIntervalType.Monthly;
      case "Tidak tentu":
        return DisbursmentIntervalType.Unexpected;
      case "Darurat":
        return DisbursmentIntervalType.Emergency;
      default:
        return DisbursmentIntervalType.Daily;
    }
  }
}
