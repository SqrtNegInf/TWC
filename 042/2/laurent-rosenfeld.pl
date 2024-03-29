#!/usr/bin/env perl
use v5.36;

srand 1;

sub check_parens {
    my $expr = shift;
    my @stack;
    $expr =~ s/\s+//g; # remove spaces
    for (split //, $expr) {
        push @stack, $_ if $_ eq '(';
        if ($_ eq ')') {
            return 0 if @stack == 0;
            pop @stack;
        }
    }
    return scalar @stack == 0 ? 1 : 0;
}

for ("()", "(  )", "(())", "( ( ))", ")(", "())()", 
    "((( ( ()))))",  "()()()()", "(())(())") {
        say "$_: ", check_parens($_) ? "OK" : "Not OK";
}
