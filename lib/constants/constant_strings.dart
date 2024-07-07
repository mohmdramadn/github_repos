class Constant {
  static Url urls = const Url();
  static SharedPrefsKeys prefsKeys = const SharedPrefsKeys();
  static Titles titles = const Titles();
  static PhoneValidationStatus phoneValidationStatus =
      const PhoneValidationStatus();
  static PasswordValidationStatus passwordValidationStatus =
      const PasswordValidationStatus();
  static Fonts fonts = const Fonts();
  static SharedPrefsKeys sharedPrefKeys = const SharedPrefsKeys();
  static Assets assets = const Assets();
}

class Titles{
  const Titles();
   String get register => 'Register';
   String get login => 'Login';
   String get home => 'Home';
   String get email => 'Email';
   String get enterEmail => 'Please enter your email';
   String get password => 'Password';
   String get enterPassword => 'Please enter your password';
   String get reEnterPassword => 'Re-enter Password';
   String get plzReEnterPassword => 'Please re-enter your password';
   String get firstName => 'First Name';
   String get enterFirstName => 'Please enter your first name';
   String get lastName => 'Last Name';
   String get enterLastName => 'Please enter your last name';
   String get phoneNumber => 'Phone Number';
   String get enterPhoneNumber => 'Please enter your phone number';
   String get registerSubHeader => 'Enter your data to create a new account';
   String get loginSubHeader => 'To have access to wonderful wallpapers';
   String get notConnected => 'You are offline';
   String get couldNotDownload => 'Could not download from internet';
   String get firstNameEmpty => 'First name can not be empty';
   String get lastNameEmpty => 'Last name can not be empty';
   String get savedToGallery => 'Image saved to gallery';
   String get fetchingImageSrc => 'Fetching image source....';
   String get error => 'Something happened try again later';
   String get haveAccount => 'Do you have an account ? ';
   String get doesNotHaveAccount => 'Do not have an account ? ';
   String get sureLogout => 'Are you sure you want to logout ?';
   String get logout => 'Logout';
   String get cancel => 'Cancel';
   String get search => 'Search';
   String get wallpaper => 'Wallpaper';
}

class PhoneValidationStatus{
  const PhoneValidationStatus();
   String get isEmpty => 'Please enter your phone number';
   String get isNotNumber => 'Please enter valid US number';
   String get isValid => 'Valid';
}

class PasswordValidationStatus {
  const PasswordValidationStatus();
  String get isEmpty => 'Please enter your password';
  String get isValid => 'Valid';
}

class Fonts{
  const Fonts();
  String get nexa => 'Nexa';
  String get nexaBold => 'NexaBold';
  String get nexaRegular => 'NexaRegular';
}

class Url{
  const Url();
  final String _baseUrl = 'https://api.pexels.com/v1';
  String get photosApi => '$_baseUrl/curated?per_page=';
  String get searchApi => '$_baseUrl/search?query=';
}

class SharedPrefsKeys{
  const SharedPrefsKeys();
  String get user => 'user';
}

class Assets{
  const Assets();
  String get user => 'assets/svgs/user.svg';
  String get background => 'assets/svgs/background.svg';
  String get filter => 'assets/svgs/filter.svg';
  String get search => 'assets/svgs/search.svg';
}

const String kGithubToken = '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';