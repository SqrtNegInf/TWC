#!/usr/bin/env raku

my $year = 0;

for 2026 -> $arg {
  if (( $arg < 1753 ) || ( $arg > 9999 )) {
    say "Please supply a year between 1753 and 9999";
    exit(1);
  }
  $year = $arg;
}

my $month = 1;
while $month <= 12 {
    my $d = Date.new($year, $month, 13);
    if $d.day-of-week == 5 {
        say "$year $month 13 : was a Friday";
    }
    $month++;
}
