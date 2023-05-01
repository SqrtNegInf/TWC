#!/usr/bin/env raku

sub MAIN(
    @scores = (2,5,2,1,7,5,1)
) {
    @scores.classify( { $_ }, :into(my %quantities;) );
    %quantities = %quantities.keys.map({ $_ => %quantities{$_}.elems; });

    my @ordered = @scores.sort({ $^b <=> $^a });
    my %ranks;
    my $currentRank = 1;
    my $quantity = 0;

    for 0 .. @ordered.end -> $i {
        if $quantity == 0 {
            $quantity = %quantities{@ordered[$i]};
        }
        $quantity--;

        given $currentRank {
            when 1 { %ranks{@ordered[$i]} = 'G' };
            when 2 { %ranks{@ordered[$i]} = 'S' };
            when 3 { %ranks{@ordered[$i]} = 'B' };
            default { %ranks{@ordered[$i]} = $currentRank; }
        }

        if $quantity == 0 {
            $currentRank += %quantities{@ordered[$i]};
        }
    }

    say q{(}, @scores.map({ %ranks{$_}; }).join(q{,}), q{)};
}
