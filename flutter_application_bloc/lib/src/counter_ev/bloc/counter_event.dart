part of 'counter_bloc.dart';

@immutable
/*
Equatable تقارن الاوبجكت ببعض دارت بتقارن الريفرنس بالميمو ولما نستخدم هاي المكتبة
بنخليه يعرف كيف يقارن ... والا الحالة راح تضل تتغير باستمرار
*/
sealed class CounterEvent extends Equatable{
@override
  List<Object> get props => [];
}
class IncrementEvent extends CounterEvent{}

class DecrementEvent extends CounterEvent{}