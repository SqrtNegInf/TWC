#!/usr/bin/env perl
use v5.36;

sub separate_digits{
    return separater([], @_); 
}

sub separater{
    my $seperated = shift;
    return @{$seperated} if @_ == 0;
    my @digits = @_;
    push @{$seperated}, split //, shift @digits;
    separater($seperated, @digits);
}

MAIN:{
    say join q/,/, separate_digits 1, 34, 5, 6;
}
