#!/usr/bin/env perl
use v5.36;

no strict "refs";

our $test; # for testing this

# Randomly populate the dynamic variable
my $dynamic_variable_name = 'foo';
my $random_value          = 42;
$$dynamic_variable_name   = $random_value;

# Say random variable name and value
say 'Random variable name: ' .  $dynamic_variable_name;
say 'Random value: ' . ${$dynamic_variable_name};

# test like this: ch2.pl test
say 'Variable test is: ' .  $test
    if ($dynamic_variable_name eq 'test');


