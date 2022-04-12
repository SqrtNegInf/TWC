#!/usr/bin/env raku

sub MAIN() {
    my @people = 1..50;
    while @people.elems > 1 {
        my $sword = @people.shift;
        @people.shift;
        @people.push($sword);
    }

    say "Survivor is at position @people[0]";
}
