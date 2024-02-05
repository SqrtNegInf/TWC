#!/usr/bin/env raku

use Test;

=begin comment
254-1: Three Power          Submitted by: Mohammad S Anwar
Given a positive integer, $n, write a script to return true if the
given integer is a power of three otherwise return false.

Example 1
Input: $n = 27
Output: true

=end comment

constant \Part-power = 40;                              # partitioning power
constant \Part = 3**Part-power;                         #       "      value
constant \Test-to-power = 100;                          # rough range for tests
constant @test-powers = 3, * × 3 … 3**Test-to-power;    # passing test values

constant @standard = gather { # create standard for look up in the partition
    state $count = 1;
    state $value = 1;
    while $count < Part-power {
        take $value ×=3;
        ++$count;
    }
}

sub power3 ( Int $i is copy -->Bool) {
    if $i ≤ @standard[*-1]  {
        if $i == @standard.any {
            return True if $i == @standard.any;
        } else {
            return False;
        }
    } else {
        my $shrunk = $i div @standard[*-1];             # shrink by a partition
        return False if $i ÷ @standard[*-1] ≠ $shrunk;  # not integer
        return power3 $shrunk;
    }
    die "reached but did not grasp";
}

my @Test = 
    [ True,  @test-powers,              ],
    [ False, @test-powers».&{ $_ + 1}   ],
    [ False, @test-powers».&{ $_ + 2}   ],
    [ False, @test-powers».&{ $_ + 3}   ],
;

plan +@Test × @Test[0][1];

for @Test -> @sub-test {
    for @sub-test -> $exp, @t {
        for @t -> $in {
            is power3($in), $exp, "$exp <- power3( $in)";
        }
    }
}

done-testing;

my $n = 3**1267;
say "\nInput: \$n = $n\nOutput: ", power3( $n).Str.lc;
$n += 9;
say "\nInput: \$n = $n\nOutput: ", power3( $n).Str.lc;
