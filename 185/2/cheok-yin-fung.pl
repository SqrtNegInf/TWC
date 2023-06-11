#!/usr/bin/env perl
use v5.36;

sub mask_code_str {
    my @arr = split "", $_[0];
    my $i = 3;
    my $j = 0;
    my $ans = "";
    while ($i >= 0 && $j <= $#arr) {
        if ($arr[$j] =~ /[a-z0-9]/) {
            $i--;
            $ans .= "x";   
        }
        else {
            $ans .= $arr[$j];
        }
        $j++;
    }
    if ($j <= $#arr) {
        $ans .= $arr[$_] for $j..$#arr;
    }
    return $ans;
}

use Test::More tests=>2;
use Test::Deep;
my @list1 = ('ab-cde-123', '123.abc.420', '3abc-0010.xy');
cmp_deeply( [map {mask_code_str $_} @list1],
    ['xx-xxe-123', 'xxx.xbc.420', 'xxxx-0010.xy']);
my @list2 = ('1234567.a', 'a-1234-bc', 'a.b.c.d.e.f');
cmp_deeply( [map {mask_code_str $_} @list2],
    ['xxxx567.a', 'x-xxx4-bc', 'x.x.x.x.e.f']);
done_testing;
