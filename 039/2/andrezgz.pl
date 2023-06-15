#!/usr/bin/env perl
use v5.36;

# the order of the operands is inverted on subroutines
# for the proper operation to take place
# while allowing directly popping from @stack
# without the need of temporary variables
my $operations = {
    '+' => sub { $_[1] + $_[0] },
    '-' => sub { $_[1] - $_[0] },
    # used 'x' instead of '*'
    # because I liked the way of adding operands and operators
    # as simple command-line argument rather than using a string
    'x' => sub { $_[1] * $_[0] },
    '/' => sub { $_[1] / $_[0] },
};

my @stack;
while (my $e = shift @ARGV) {
    push @stack, $e =~ /^\d+$/ ? $e : $operations->{$e}->(pop @stack,pop @stack)
}
print @stack;
