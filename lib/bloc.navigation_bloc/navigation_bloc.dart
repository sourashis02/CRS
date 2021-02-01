import 'package:CRS/pages/complaintstatus_screen.dart';
import 'package:bloc/bloc.dart';
import '../pages/profile_screen.dart';
import '../pages/complaint_screen.dart';
import 'package:CRS/pages/homepage.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  MyAccountClickedEvent,
  ComplaintClickedEvent,
  ComplaintstatusClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => HomePage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield HomePage();
        break;
      case NavigationEvents.MyAccountClickedEvent:
        yield MyAccountsPage();
        break;
      case NavigationEvents.ComplaintClickedEvent:
        yield Complaint();
        break;
      case NavigationEvents.ComplaintstatusClickedEvent:
        yield Complaintstatus();
        break;
    }
  }
}
