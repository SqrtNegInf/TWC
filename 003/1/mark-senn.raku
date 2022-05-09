#!/usr/bin/env raku

# what?

# Maximum exponent.
my $m = 2;

# Construct the result.
my @r = ();
# No need to get fancy---nested loops
# will produce only the numbers needed.
for (1..$m) -> $i  {
    for (1..$m) -> $j  {
        for (1..$m) -> $k  {
            @r.push(2**$i * 3**$j * 5**$k);
        }
    }
}

# Print the result.
@r.sort.join("\n").say;
