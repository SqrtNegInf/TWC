#!/usr/bin/env raku
multi sub MAIN (Numeric $number where $number >= 0 = +007.0)
{
     say +$number;
}

#multi sub MAIN ($value) { say $value; }
