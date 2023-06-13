#!/usr/bin/env perl
use v5.36;

use Number::Convert::Roman;

my @ARGV = <V + VI>;
my $input_string = join ' ', @ARGV;
my $c = Number::Convert::Roman->new;

my %operations = (
    '+' => sub {return ($c->arabic($_[0]) + $c->arabic($_[1]))},
    '-' => sub {return ($c->arabic($_[0]) - $c->arabic($_[1]))},
    'x' => sub {return ($c->arabic($_[0]) * $c->arabic($_[1]))},
    '/' => sub {return ($c->arabic($_[0]) / $c->arabic($_[1]))},
);

if ($input_string =~ /^(\w+)\s*([\+\-x\/])\s*(\w+)$/) {
    say $c->roman(int($operations{$2}->($1, $3)));
} else {
    say "Invalid input";
}
