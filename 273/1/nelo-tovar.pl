#!/usr/bin/env perl
use v5.28;
use strict;
use warnings;

use POSIX qw/ceil/;

my @examples = (
    {str => 'perl', chr => 'e' },
    {str => 'java', chr => 'a' },
    {str => 'python', chr => 'm' },
    {str => 'ada', chr => 'a' },
    {str => 'ballerina', chr => 'l' },
    {str => 'analitik', chr => 'k' },
);

sub percentage_of_character {
    my $element = shift;
    my $str_len = length($element->{str});
    my $count = () = $element->{str} =~ /$element->{chr}/g;

    return int(($count * 100 / $str_len) + 0.5)

}

for my $elements (@examples) {
    my $poc = percentage_of_character $elements;

    printf "Input  : str = '%s', chr = '%s'\n", $elements->{str}, $elements->{chr};
    printf "Output : %s\n\n", $poc;
}
