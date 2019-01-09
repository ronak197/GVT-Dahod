class CandidateProfile {

  static String profileType = 'default';

  static String candidateName;
  static String address;
  static String mobileNo;
  static String dateOfBirth;
  static String work;
  static String gender;
  static String caste;

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


  static String drawerUsername = "Guest";
  static String drawerUsernameSign = "Not Logged In";

  static void switchToDefault(){
    profileType = 'default';
    drawerUsername = "Guest";
    drawerUsernameSign = "Not Logged In";
  }

  static void switchToWorker(){
    profileType = 'worker';
    drawerUsername = candidateName;
    drawerUsernameSign = mobileNo;
  }

  static void switchToCompany(){
    profileType = 'company';
    drawerUsername = companyName;
    drawerUsernameSign = city;
  }

}