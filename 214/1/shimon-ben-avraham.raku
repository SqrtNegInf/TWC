#!/usr/bin/env raku

enum Medals « :G(1) S B »;
my @medals = (Nil, Medals::G, Medals::S, Medals::B);

subset ℕ of UInt where * > 0;

#| Handle bad input
multi sub rank-score (@scores where not (.all ~~ ℕ) --> Failure) {
    #note "All scores must be integers greater than zero!";
    return Failure;
} # end of multi sub rank-score (@scores where !(.all ~~ UInt) || .any ≤ 0)

#| Handle good input!
multi sub rank-score (@scores --> List) {
    my Int $index = 0;
    # Create a Hash where the keys are the position in the @scores array,
    # and the values are the values of the @scores array.
    my %index-with-scores = @scores.map: $index++ => *;

    # Now create an array of pairs, reverse-sorted by value. So the winner
    # (with the highest score) is at index 0.
    my @index-with-scores = %index-with-scores.sort(*.values).reverse;

    my Int $rank   = 0;
    my $prev-value = 0;
    my Int $count  = 1;
    for @index-with-scores {
        if .value == $prev-value {
            # Handle ties
            $count++;
        } else {
            # Descend the rank, usually by one 
            # (5ᵗʰ place comes after 4ᵗʰ place). 
            #
            # But after ties, we descend more than one. 
            # (e.g. if two Gold medals are given, the next winner is in 3ʳᵈ,
            #  not 2ⁿᵈ, place and receives a Bronze medal.)
            $rank += $count;
            $count = 1;
        } # end of } else
        $prev-value = .value;
        .value = $rank;
    } # end of for @index-with-scores 

    # Now sort the array on the keys - this will return the array to its
    # original order, but with ranks instead of scores at each index.
    my @index-with-ranks = @index-with-scores.sort;

    # We're only interested in the ranks, 
    # which are the values of each Pair in the array.
    my @retval = @index-with-ranks.map: |*.values;

    # Substitute G, S, or B for 1ˢᵗ, 2ⁿᵈ, and 3ʳᵈ place, respectively.
    @retval .= map: { @medals[$_] // $_ };

    # The challenge specified the output be a List, not an Array.
    return @retval.List;
} # end of sub rank-score (UInt @scores)

use Test;

my @test-cases = [ 
    # Bad input
    { test => &is, input => (0, 1,   2), output => Failure, 
        explanation => "Zero not allowed OK"; }
    { test => &is, input => (1, 2.5, 3), output => Failure, 
        explanation => "Non-integers not allowed OK"; }
    { test => &is, input => (1, 2,  -3), output => Failure, 
        explanation => "Negative numbers not allowed OK"; }

    # Challenge Examples
    { test => &is-deeply, input => (1,2,4,3,5    ), output => (5,4,S,B,G    ), 
        explanation => 'Example 1 OK';  }
    { test => &is-deeply, input => (8,5,6,7,4    ), output => (G,4,B,S,5    ), 
        explanation => 'Example 2 OK';  }
    { test => &is-deeply, input => (3,5,4,2      ), output => (B,G,S,4      ), 
        explanation => 'Example 3 OK';  }
    { test => &is-deeply, input => (2,5,2,1,7,5,1), output => (4,S,4,6,G,S,6), 
        explanation => 'Example 4 OK';  }
]; # end of my @test-cases 

for @test-cases -> %test {
    %test<test>(rank-score(%test<input>), %test<output>, %test<explanation>);
}
