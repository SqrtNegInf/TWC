#!/usr/bin/env perl
use v5.36;

say "challenge-216-task1";

sub registration_number {
    my $reg = shift;
    my @words = @{+shift};
    my @out = ();
    say "Input: \@words = (@words) , \$reg = '$reg'";
    my %hreg = ();
    my @hreg = grep { /[a-z]/ } split //, lc $reg;
    $hreg{$_} = 1 for @hreg;
    for my $word (@words) {
        my %hword = ();
        $hword{$_} = 1 for (split //, lc $word);
        my @i = grep { exists $hreg{$_} } keys %hword;
        push @out, $word if $#i == $#hreg;
    }
    say "Output: (@out)\n";
}

while (<DATA>) {
    chomp;
    my ($reg, @words) = split ',';
    registration_number($reg, \@words);
}


__DATA__
AB1 2CD,abc,abcd,bcd
007 JB,job,james,bjorg
C7 RA2,crack,road,rac
