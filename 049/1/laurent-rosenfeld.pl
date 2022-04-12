#!/usr/bin/env perl
use strict;
use warnings;
use feature "say";

my $num = 55;
my $i = 1;
while (1) {
    my $result = $num * $i;
    if ($result =~ /^[01]*$/) {
        say "$num * $i = $result";
        last;
    }
    $i++;
}
