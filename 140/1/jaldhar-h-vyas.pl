#!/usr/bin/env perl
use v5.36;

package Binary;
use overload '+' => 'add';
use overload '""' => 'toString';

sub new {
    my ($class, $str) = @_;
    my $self = \"0b$str";
    bless $self, $class;
    return $self;
}

sub add {
    my ($self, $other) = @_;
    say "overload!";
    return Binary->new(
        sprintf '%b', (sprintf '%d', oct $$self) + (sprintf '%d', oct $$other)
    );
}

sub toString {
    my ($self) = @_;
    return sprintf '%b', oct $$self;
}

package main;

my $a = Binary->new(11);
my $b = Binary->new(1);

say $a + $b;
