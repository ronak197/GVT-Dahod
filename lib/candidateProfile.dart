class CandidateProfile {

  static bool worker = false;
  static String candidateName;
  static String address;
  static String mobileNo;
  static String dateOfBirth;
  static String work;
  static String gender;
  static String caste;

  static bool company = false;
  static String companyName;
  static String city;
  static String email;
  static String contactNo;
  static String username;
  static int nofmason;
  static int wofmason;
  static int nofpainter;
  static int wofpainter;
  static int nofplumber;
  static int wofplumber;
  static int nofbarbinder;
  static int wofbarbinder;


  static bool defaultUser = true;

  static void switchToDefault(){
    worker = false;
    company = false;
    defaultUser = true;
  }

  static void switchToWorker(){
    worker = true;
    company = false;
    defaultUser = false;
  }

  static void switchToCompany(){
    worker = false;
    company = true;
    defaultUser = false;
  }

  static void getProfile(){
    String getCompany(){
      return companyName;
    }
  }
}