abstract class NewsStates{}

class NewsInitialState extends NewsStates{}

class BottomNavState extends NewsStates{}


class newsGetBussinesSucceesState extends NewsStates{}
class newsGetBussinesErrorState extends NewsStates
{
  final String error;
  newsGetBussinesErrorState(this.error);
}
class newsGetBussinesLoadingState extends NewsStates{}


class newsGetSportsSucceesState extends NewsStates{}
class newsGetSportsErrorState extends NewsStates
{
  final String error;
  newsGetSportsErrorState(this.error);
}
class newsGetSportsLoadingState extends NewsStates{}



class newsGetScienseSucceesState extends NewsStates{}
class newsGetScienseErrorState extends NewsStates
{
  final String error;
  newsGetScienseErrorState(this.error);
}
class newsGetScienseLoadingState extends NewsStates{}

// ignore: camel_case_types
class changeModeState extends NewsStates{}

class newsGetSearchSucceesState extends NewsStates{}
class newsGetSearchErrorState extends NewsStates
{
  final String error;
  newsGetSearchErrorState(this.error);
}
class newsGetSearchLoadingState extends NewsStates{}



