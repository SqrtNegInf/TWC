#!/usr/bin/env raku


my $year = @*ARGS[0] // 2023;

my @dates;
for 1..12 -> $month {
    my $dt = DateTime.new(year => $year, month => $month, day => 13);
    if ($dt.day-of-week == 5) {
        push @dates, $dt;
    }
}

if @dates {
    my $count = @dates.elems;

    if $count == 1 {
        say "There is only one Friday the 13th in $year:";
    }
    else {
        say "There are {@dates.elems} Fridays the 13th in $year:";
    }

    .mm-dd-yyyy.say for @dates;
}
else {
    say "There are no Friday the 13th in $year.";
}
