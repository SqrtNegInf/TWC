#!/usr/bin/env raku

#sub MAIN( Str :$p is copy, Str :$w ) {

my $p = "Joe hit a ball, the hit ball flew far after it was hit.";
my  $w = "hit";

    $p ~~ s:g/ \W* $w \W+/ /;
    my $classification = Bag.new: $p.split( / \W+ /, :skip-empty );
    $classification.keys.grep( { $classification{ $_ } == $classification.values.max } ).first.say;

#}
