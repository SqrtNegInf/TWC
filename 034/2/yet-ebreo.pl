#!/usr/bin/env perl
use v5.36;

my %table = ( 
    add         => \&add,
    subtract    => \&subtract,
    multiply    => \&multiply,
    divide      => \&divide
);

sub divide {
    my ($m,$n) = @_;
    say "Error: Divide by 0" if !$n;

    return $m/$n;
}

sub add {
    my ($m,$n) = @_;
    return $m+$n;
}

sub subtract {
    my ($m,$n) = @_;
    return $m-$n;
}

sub multiply {
    my ($m,$n) = @_;
    return $m*$n;
}

my $commands = "add multiply subtract divide";
my @operands = (43,6);
for my $cmd ($commands=~/\w+/g) {
    say "[$cmd]";
    say $table{$cmd}->(@operands);
}
