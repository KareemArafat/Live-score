import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/features/day%20matches/presentation/manager/day_matches_cubit/day_matches_cubit.dart';
import 'package:live_score_app/features/day%20matches/presentation/widgets/calender_sheet.dart';

class DateSection extends StatefulWidget {
  const DateSection({super.key});

  @override
  State<DateSection> createState() => _DateSectionState();
}

class _DateSectionState extends State<DateSection> {
  late String dayName;
  late String dayDate;
  late DateTime selectedDate;
  late DayMatchesCubit cubit;

  void getDateInfo({DateTime? calenderDate, int count = 0}) {
    final now = DateTime.now();
    selectedDate = (calenderDate ?? now).add(Duration(days: count));
    bool isToday =
        selectedDate.year == now.year &&
        selectedDate.month == now.month &&
        selectedDate.day == now.day;
    dayName = isToday ? 'Today' : DateFormat('EEEE').format(selectedDate);
    dayDate = DateFormat('dd/MM/y').format(selectedDate);
  }

  @override
  void initState() {
    cubit = BlocProvider.of<DayMatchesCubit>(context);
    getDateInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => CalendarSheet(
                onSelect: (selectedDate) {
                  setState(() {
                    getDateInfo(calenderDate: selectedDate);
                  });
                  cubit.day = dayDate;
                  cubit.getDayMatches();
                },
              ),
            );
          },
          icon: Icon(Icons.calendar_month_outlined, color: AppColors.grayColor),
        ),
        Text(dayDate, style: AppStyles.grayBody12),
        Spacer(),
        Text(
          dayName,
          style: AppStyles.heading18,
          overflow: TextOverflow.ellipsis,
        ),
        Spacer(),
        IconButton(
          onPressed: () {
            setState(() {
              getDateInfo(calenderDate: selectedDate, count: -1);
            });
            cubit.day = dayDate;
            cubit.getDayMatches();
          },
          icon: Icon(
            Icons.arrow_circle_left_outlined,
            size: 27.5,
            color: AppColors.grayColor,
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              getDateInfo(calenderDate: selectedDate, count: 1);
            });
            cubit.day = dayDate;
            cubit.getDayMatches();
          },
          icon: Icon(
            Icons.arrow_circle_right_outlined,
            size: 27.5,
            color: AppColors.grayColor,
          ),
        ),
      ],
    );
  }
}
