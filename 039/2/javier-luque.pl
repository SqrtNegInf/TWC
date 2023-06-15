#!/usr/bin/env perl
use v5.36;

say evaluate_stack('15 7 1 1 + - / 3 * 2 1 1 + + -');

# Evaluate the stack
sub evaluate_stack {
    my @tokens = split(/\s/, shift);
    my @stack;

    # Some utf-8 friendly operations
    my $operations = {
        '+' => \&add,
        '-' => \&subtract,
        '−' => \&subtract,
        '*' => \&multiply,
        '×' => \&multiply,
        '÷' => \&divide,
        '/' => \&divide,
    };

    for my $token (@tokens) {
        if ($operations->{$token}) {
            push @stack, $operations->{$token}->(\@stack);
        } elsif ($token =~ /\d+/) {
            push @stack, $token;
        }
    }

    return pop(@stack);
}

# Operations
sub add      { my $s = shift; return pop(@$s) + pop(@$s) }
sub subtract { my $s = shift; return - pop(@$s) + pop(@$s) }
sub multiply { my $s = shift; return pop(@$s) * pop(@$s) }
sub divide   { my $s = shift; return (1 / pop(@$s)) * pop(@$s) }

