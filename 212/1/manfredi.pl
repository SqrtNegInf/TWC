#!/usr/bin/env perl

use v5.36;

sub jumping_letters {
    my $word = shift;
    my @jump = @{+shift};

    die("Only alphabetic characters allowed in '$word'") unless $word =~ /^[A-Za-z]+$/;
    die("Only positive integers allowed in '@jump'") unless join('', @jump) =~ /^\d+$/;
    die("The length of '$word' must be the same of elements in '@jump'") if length($word) != @jump;
    
    my @lower = map { /[a-z]/ ? 1 : 0 } split '' , $word;
    my @word = split '', uc $word;

    my %ascii = ();
    @ascii{'A'..'Z'} = ( ord('A') .. ord('Z') );
    my $mod = %ascii;

    my %ascii_mod = ();
    @ascii_mod{1..$mod} = ('A'..'Z');

    my %ascii_mod_rev = ();
    @ascii_mod_rev{'A'..'Z'} = (1..$mod);

    @word = map { $ascii_mod{ ($ascii_mod_rev{ $word[$_] } + $jump[$_]) % $mod } } 0..$#jump;
    my $res = join '', map { $lower[$_] ? lc $word[$_] : uc $word[$_] } 0..$#word;

    print "$word, '@jump': $res\n";

}

while (<DATA>) {
    my ($w, @j) = split /\s+/;
    jumping_letters($w, \@j);
}


__DATA__
Perl 2 22 19 9
Raku 24 4 7 17
