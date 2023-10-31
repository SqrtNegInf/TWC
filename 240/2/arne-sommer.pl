#!/usr/bin/env perl

use Perl6::Junction "all";

my @int        = (0, 2, 1, 5, 3, 4);
my $last_index = @int -1;
my @output     = map { $int[$int[$_]] } (0 .. $last_index);

print "(", join(", ", @output), ")\n";
