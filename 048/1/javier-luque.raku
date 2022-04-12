#!/usr/bin/env raku

sub MAIN() {
    my @people = 1..50;
    kill-and-switch(@people) while (@people.elems > 1);
    say @people[0] ~" is still alive";
}

# Kill and Switch
sub kill-and-switch(@people) {
    # switch
    push @people, shift @people;

    # kill
    shift @people;
}
