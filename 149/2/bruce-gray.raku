#!/usr/bin/env raku

subset Base of Int where 2..36;

sub no-reps ( Str $s --> Bool ) { $s.comb.repeated.not }

sub largest_rep-free_square_in_base ( Base $base ) {
    my Str $highest = (^$base)».base($base).join.flip; # 'BA9876543210' for $base==12

    my UInt $root = $highest.parse-base($base).sqrt.round;

    $root-- until ($root²).base($base).&no-reps;

    return $root;
}

my @bases = flat map { /(\d+)\-(\d+)/ ?? (+$0 .. +$1) !! $_ },
            (@*ARGS ?? @*ARGS !! <2-6>);
            #(@*ARGS ?? @*ARGS !! <2-12 14-16 18>);

my @res;

for @bases -> Base $base {
    my $root = largest_rep-free_square_in_base($base);

    @res.push: sprintf "%2s  %10s  %20s  %8s  %16s",
        $base, $root, $root², $root.base($base), ($root²).base($base);
}

say my $result = @res.join("\n");

my $ref = q:to/END/;
 2           1                     1         1                 1
 3           1                     1         1                 1
 4          15                   225        33              3201
 5          24                   576        44              4301
 6         195                 38025       523            452013
END

use Test;
is $result, chomp $ref;
