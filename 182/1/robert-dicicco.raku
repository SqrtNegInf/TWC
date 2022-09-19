#!/usr/bin/env raku

# not to task spec

my @n = (5, 2, 9, 1, 7, 6, 9); 

my %n_ndx = ();

my $count = 0;

for (@n) {

  %n_ndx{$_} = $count++;

}

my @n_srt = @n.sort.reverse;

print "Input: \@n = \(" ~ @n ~ "\)\n";

print "Output: %n_ndx{@n_srt[0]}\n";
