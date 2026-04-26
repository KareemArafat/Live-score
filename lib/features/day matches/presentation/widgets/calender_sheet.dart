import 'package:flutter/material.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarSheet extends StatefulWidget {
  const CalendarSheet({super.key, required this.onSelect});
  final void Function(DateTime selectedDay) onSelect;
  @override
  State<CalendarSheet> createState() => _CalendarSheetState();
}

class _CalendarSheetState extends State<CalendarSheet> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(12),
        height: context.isLandscape
            ? context.screenHeight / 1.2
            : context.screenHeight / 2.5,
        width: context.screenWidth / 1.2,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: TableCalendar(
          daysOfWeekHeight: context.h(50),
          shouldFillViewport: true,
          headerStyle: HeaderStyle(
            titleTextStyle: AppStyles.body12(context),
            headerPadding: EdgeInsets.zero,
            headerMargin: const EdgeInsets.only(bottom: 8),
            titleCentered: true,
            formatButtonShowsNext: false,
            formatButtonVisible: false,
            decoration: BoxDecoration(
              gradient: AppColors.blueGradient,
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          calendarStyle: CalendarStyle(
            defaultTextStyle: AppStyles.blockBody10(context),
            weekendTextStyle: AppStyles.blockBody10(context),
            todayTextStyle: AppStyles.blockBody10(context),
            outsideTextStyle: AppStyles.blockBody10(context),
            selectedTextStyle: AppStyles.body10(context),
            todayDecoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.baseColor2, width: 1.4),
            ),
            selectedDecoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColors.blueGradient,
            ),
          ),
          firstDay: DateTime.utc(2024),
          lastDay: DateTime.utc(2030),
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          onDaySelected: (selectedDay, focusedDay) async {
            if (!isSameDay(_selectedDay, selectedDay)) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
              widget.onSelect(selectedDay);
              await Future.delayed(const Duration(seconds: 1));
              if (context.mounted) Navigator.pop(context);
            }
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
        ),
      ),
    );
  }
}
