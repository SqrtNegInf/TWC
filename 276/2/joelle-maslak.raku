#!/usr/bin/env raku

#sub MAIN(Str:D $numberstr is copy) {
 my $numberstr = '1, 2, 2, 4, 1, 5';
    $numberstr ~~ s:g/<[(),]>/ /;
    $numberstr ~~ s/^ \s+ (.*) \s+ $/$0/;
    my $nums = Bag.new($numberstr.split(/\s+/)».Int);

    my $max = $nums.values.max;
    say $max * $nums.grep(*.value == $max).elems;
#}
