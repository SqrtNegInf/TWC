#!/usr/bin/env perl
use v5.36;
use boolean;

sub capital_detection{
    {my($s) = @_; return true if length($s) == $s =~ tr/A-Z//d;}
    {my($s) = @_; return true if length($s) == $s =~ tr/a-z//d;}
    {
        my($s) = @_; 
        $s =~ m/(^.{1})(.*)$/;
        my $first_letter = $1;
        my $rest_letters = $2;
        return true if $first_letter =~ tr/A-Z//d == 1 &&
                       length($rest_letters) == $rest_letters =~ tr/a-z//d;
    }
    return false;
}

MAIN:{
    say capital_detection(q/Perl/);
    say capital_detection(q/TPF/);
    say capital_detection(q/PyThon/);
    say capital_detection(q/raku/);
}
