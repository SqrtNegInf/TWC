#!/usr/bin/env perl
use v5.36;

package Stack;

use List::Util;

sub new {
	my $class = shift;
	return bless \@_, $class;
}

sub push {
	my ($self, @args) = @_;
	push @$self, @args;
}

sub pop {
	pop @{$_[0]};
}

sub top {
	return $_[0]->[-1];
}

sub min {
	return List::Util::min @{$_[0]};
}

package main;

use Test::More tests => 3;

my $stack = Stack->new;
$stack->push (2);
$stack->push (-1);
$stack->push (0);
is $stack->pop, 0, 'Popped 0';
is $stack->top, -1, '-1 is at stack top';
$stack->push (0);
is $stack->min, -1, '-1 is min value';
