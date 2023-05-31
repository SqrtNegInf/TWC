#!/usr/bin/env perl
use v5.36;

use List::Util 'min';

#
# First off, this is a very strange exercise. "push", "pop" and "top"
# are bog standard stack operations.
#
# min, however, is *NOT*. If you want a min operation, a stack is a
# horrible choice of datastructure, and you'd fail algorithms 101
# is that were your choice. Use a heap, or some kind of balanced tree.
#

my $ERROR = "Stack is empty";

my @stack;
while (<DATA>) {
    if (/^push\s+(.*)/) {push @stack => $1}
    if (/^pop/)         {pop  @stack}
    if (/^top/)         {say  $stack [-1]  // $ERROR}
    if (/^min/)         {say  min (@stack) // $ERROR}
}

__END__
push 1
push 2
push 3
top 
pop 
top 
min
