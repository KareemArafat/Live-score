enum MatchEventsEnum {
  goal("Goal"),
  yellowCard("Yellow Card"),
  redCard("Red Card"),
  subst("Substitution"),
  varEvent("Goal Disallowed"),
  crossbar('WoodWork'),
  goalType('Field Goal'),
  woodWork('Woodwork'),
  penaltyMiss('Penalty Miss');

  final String value;
  const MatchEventsEnum(this.value);
}

enum MatchStatusEnum {
  scheduled("Scheduled"),
  firstHalf("1st Half"),
  halfTime("Halftime"),
  secondHalf("2nd Half"),
  afterET("After ET"),
  afterPenalties("After Penalties"),
  justEnded("Just Ended"),
  ended("Ended"),
  canceled("Canceled"),
  postponed("Postponed"),
  fro("Final Result Only"),
  abandoned("Abandoned"),
  suspend("Suspended");

  final String value;
  const MatchStatusEnum(this.value);
}

