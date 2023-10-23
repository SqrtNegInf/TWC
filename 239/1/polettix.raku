#!/usr/bin/env raku

my $s1 = 'ab,c';
my $s2 = 'a,bc';

say is-same-string($s1.split(/\,/), $s2.split(/\,/));

sub is-same-string (@s1, @s2) { @s1.join('') eq @s2.join('') }
