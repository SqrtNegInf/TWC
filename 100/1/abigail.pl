#!/usr/bin/env perl
use v5.36;

while (<DATA>) {
    #
    # Parse the input, and replace it.
    # If we have a time ending at PM, add 12 to the hour (unless the
    # hour is already 12). If we have a time ending with AM, leave
    # the hour as is, unless it's 12, then it becomes 0. If no AM/PM
    # is given, subtract 12 from the hour if it's 12 or larger, and
    # add 12 if it's 0 (after the possible subtraction).
    #
    # Minutes always stay what they are.
    #
    # Add PM/AM if there was no AM/PM before -- add PM if the hour
    # is 12 or larger, AM otherwise.
    # 
    say s {^\s* ([0-9]+) : ([0-9]+) \s* ([pa]?)m? \s*\n}
          {sprintf "%02d:%02d%s",
              $3 ? ($1 % 12) + (lc ($3) eq "a" ? 0 : 12)
                 : ($1 % 12) || 12,
              $2,
              $3 ? ""
                 : $1 >= 12 ? "pm" : "am"}xeir
}

__END__
17:50
