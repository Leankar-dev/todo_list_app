import 'package:intl/intl.dart';

abstract class DateFormatter {
  static final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');
  static final DateFormat _timeFormat = DateFormat('HH:mm');
  static final DateFormat _dateTimeFormat = DateFormat('dd/MM/yyyy HH:mm');
  static final DateFormat _weekdayFormat = DateFormat('EEEE', 'pt_BR');
  static final DateFormat _monthYearFormat = DateFormat('MMMM yyyy', 'pt_BR');
  static final DateFormat _shortDateFormat = DateFormat('dd MMM', 'pt_BR');

  static String formatDate(DateTime date) {
    return _dateFormat.format(date);
  }

  static String formatTime(DateTime date) {
    return _timeFormat.format(date);
  }

  static String formatDateTime(DateTime date) {
    return _dateTimeFormat.format(date);
  }

  static String formatWeekday(DateTime date) {
    return _weekdayFormat.format(date);
  }

  static String formatMonthYear(DateTime date) {
    return _monthYearFormat.format(date);
  }

  static String formatShortDate(DateTime date) {
    return _shortDateFormat.format(date);
  }

  static String formatRelative(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dateOnly = DateTime(date.year, date.month, date.day);
    final difference = dateOnly.difference(today).inDays;

    if (difference == 0) {
      return 'Hoje';
    } else if (difference == 1) {
      return 'Amanha';
    } else if (difference == -1) {
      return 'Ontem';
    } else if (difference > 1 && difference <= 7) {
      return 'Em $difference dias';
    } else if (difference < -1 && difference >= -7) {
      return 'Ha ${-difference} dias';
    } else {
      return formatDate(date);
    }
  }

  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  static bool isTomorrow(DateTime date) {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return date.year == tomorrow.year &&
        date.month == tomorrow.month &&
        date.day == tomorrow.day;
  }

  static bool isPast(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dateOnly = DateTime(date.year, date.month, date.day);
    return dateOnly.isBefore(today);
  }

  static bool isOverdue(DateTime? dueDate) {
    if (dueDate == null) return false;
    return isPast(dueDate);
  }
}
