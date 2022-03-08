#!/usr/bin/env raku

say sort tug-of-war(10, 20 ... 100);
say sort tug-of-war(10, -15, 20, 30, -25, 0, 5, 40, -5);

sub tug-of-war(+$list)
{
    my %h = $list.combinations(+$list div 2).map(-> $a
    {
        my $b = ($list (-) $a).keys.sort.List;
        abs($b.sum - $a.sum) => ($a, $b);
    });

    %h.min; #.value;
}
