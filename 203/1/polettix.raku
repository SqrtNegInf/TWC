#!/usr/bin/env raku

sub MAIN (@args = <9 0 1 2 3 4 5 6>) { put special-quadruplets(@args) }

sub special-quadruplets (@nums) {
   combinations(@nums, 4).grep({$_[0..2].sum == $_[3]}).elems
}
