#!/usr/bin/env perl
use v5.36;
use Memoize;
memoize("optimize");

my @values = (4, 2, 3, 6, 5, 3);
my ($value,@houses)=optimize(0);
say "Input: ", join ", ", @values;
say "Output: $value";
say "Houses: ", join ", ", @houses;
sub optimize {
    my $first=shift;
    my $value=$values[$first];
    return (0) if $first >= @values; # No more houses
    return ($value, $first) if $first==@values-1; # Only one house left
    my ($v1, @h1)=optimize($first+1); # what if I skip first house?
    my ($v2, @h2)=optimize($first+2,); # what if I rob first and skip next?
    my $v3=$value+$v2;
    $v3>$v1 # which option is best?
	?($v3, $first, @h2) # First one and skip next
	:($v1, @h1); # or skip first one
}
