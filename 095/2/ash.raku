#!/usr/bin/env raku
#
# Task 2 from
# https://perlweeklychallenge.org/blog/perl-weekly-challenge-095/

# The taks is to demonstrate stack _operations_, not _imlementaion_.

srand 1;

class Stack {
    has @!stack;

    method push($n) { @!stack.push($n) }
    method pop { @!stack.pop }
    method top { @!stack[*-1] }
    method min { @!stack.min }

    method empty { !@!stack }
}

my $s = Stack.new;
# $s.stack; # is unreachable

my @rand_values = <3 0 5 8 6 0 8 8 1 8>;
for ^10 {
    my $n = @rand_values[$_];
    say "push($n)";
    $s.push($n);

    say "\ttop = {$s.top}, min = {$s.min}";
}

say "pop() = {$s.pop}" while !$s.empty;
