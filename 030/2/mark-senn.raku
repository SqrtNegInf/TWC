#!/usr/bin/env raku

sub MAIN()
{
    for (1..10) -> $i  {
        for (1..10) -> $j  {
            for (1..10) -> $k  {
                ($i + $j + $k == 12)  and  say "$i,$j,$k";
            }
        }
    }

    # Optimize so we don't need to examine as many numbers.
    for (1..10) -> $i  {
        for (1..12-$i-1) -> $j  {
            for (12-$i-$j..10) -> $k  {
                ($i + $j + $k == 12)  and  say "$i,$j,$k";
            }
        }
    }
}
