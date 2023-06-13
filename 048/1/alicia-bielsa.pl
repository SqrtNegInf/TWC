#!/usr/bin/env perl
use v5.36;

my $numberPeople = 50;
my $numberPeopleAlive = $numberPeople;
my @aPeople = ();
foreach my $position (1..$numberPeople){
    my $nextPosition = $position == $numberPeople ? 1 : $position +1;    
    my %hTmp = (  'nextPosition' => $nextPosition);
    push (@aPeople, \%hTmp);
}


my $swordPosition  = 1;
while ($numberPeopleAlive > 1){  

    my $killPosition = $aPeople[ $swordPosition - 1 ]->{'nextPosition'};
    $aPeople[ $swordPosition - 1 ]->{'nextPosition'}  = $aPeople[ $killPosition - 1 ]->{'nextPosition'};
    $swordPosition = $aPeople[ $killPosition - 1 ]->{'nextPosition'};
    $numberPeopleAlive--;

} 

print "Last Position Alive : $swordPosition\n";
