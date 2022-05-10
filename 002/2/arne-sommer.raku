#!/usr/bin/env raku
subset BaseValue  of Str where { /^<[ 0 .. 9, A .. Y ]>+$/ }
subset Base10or35 of Int where { $_ == 10 || $_ == 35 }

sub MAIN (BaseValue $value = 'ARNE', Base10or35 :$base is copy = 35)
{
    $base = 35 if $value ~~ /\D/;

    $base == 35
    ?? say $value.parse-base: $base  # base 35 -> 10
    !! say $value.base: $base        # base 10 -> 35
}
