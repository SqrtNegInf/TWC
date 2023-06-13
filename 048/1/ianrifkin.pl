#!/usr/bin/env perl
use v5.36;

my $num_people = 50;

#create array of people
my @people;
for (1..$num_people) {
    $people[$_] = $_;
}

#give first person a sword
my $curr = shift @people;

while (scalar(@people) > 1) {
    #current person has sword
    #move current person to end
    $curr = shift @people;
    push @people, $curr;

    #kill next person
    $curr = shift @people;

    next;
}


print "\n***** The lone survivor is @people *****\n\n";
