#!/usr/bin/env perl
use v5.36;

my %hSequences =();
for  my $i (1..10000){
    my @aSequence =  findCollatzSequence($i);
    push (@{$hSequences{$i}},@aSequence ) ;
}

sub findCollatzSequence {
    my $currentPoint = shift;
    my $endPoint = 1;
    my @aSequence = ();
    while ($currentPoint != $endPoint ){
        if (exists($hSequences{$currentPoint})){
            push (@aSequence, @{$hSequences{$currentPoint}});
            return @aSequence;
        }
        push (@aSequence, $currentPoint);
        if ($currentPoint % 2 == 0){
            $currentPoint = $currentPoint / 2;
        } else {
            $currentPoint = $currentPoint * 3 + 1;
        }
    }
    push (@aSequence, $endPoint);
    return @aSequence;
}

 my $count = 5;
 foreach my $number (sort {scalar(@{$hSequences{$b}}) <=> scalar(@{$hSequences{$a}}) } keys %hSequences) {
    print "$number\t".scalar(@{$hSequences{$number}})."\n";
    last if ( $count == 0 );
    $count--;
 }
