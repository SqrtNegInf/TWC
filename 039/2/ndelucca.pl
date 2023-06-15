#!/usr/bin/env perl
use v5.36;

@ARGV = '15 7 1 1 + - / 3 * 2 1 1 + + -';

my @stack;
my @rpn = split / /, shift;

while (@rpn) {

    my $in = shift @rpn;

    if ($in =~ /^\d+$/) {
        push @stack, $in;
    }else{
        my $num1 = pop @stack;
        my $num2 = pop @stack;
        push @stack, eval "$num2 $in $num1";
    }
}

print "Result: ",@stack, "\n";
