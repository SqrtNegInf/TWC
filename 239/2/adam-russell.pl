#!/usr/bin/env perl
use v5.36;

sub is_consistent{
    my($s, $allowed) = @_;
    $s =~ s/[$allowed]//g;
    return $s eq q//;
}

sub consistent_strings{
    my($strings, $allowed) = @_;
    my @consistent = grep { is_consistent $_, $allowed } @{$strings};
    return 0 + @consistent;
}

MAIN:{
    say consistent_strings [qw/ad bd aaab baa badab/], q/ab/; 
    say consistent_strings [qw/a b c ab ac bc abc/], q/abc/; 
    say consistent_strings [qw/cc acd b ba bac bad ac d/], q/cad/;
}
