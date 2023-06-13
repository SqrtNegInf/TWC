#!/usr/bin/env perl
use v5.36;

# Populate the people with position_number
my @people;
$people[$_] = $_ + 1 for (0..49);

# See who lives
kill_and_switch(\@people) while (scalar(@people > 1));
say $people[0] . " is still alive";


# Kill and Switch
sub kill_and_switch {
    my $people = shift;

    # switch
    push @$people, shift @$people;

    # kill
    shift @$people;
}
