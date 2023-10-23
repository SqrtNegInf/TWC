#!/usr/bin/env raku

#unit sub MAIN ($arr1, $arr2);
my $arr1 = <ab c>;
my $arr2 = <a bc>;

say $arr1.words.join eq $arr2.words.join
  ?? 'true'
  !! 'false';
