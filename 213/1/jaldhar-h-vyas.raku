#!/usr/bin/env raku

sub MAIN(
    @list = <1 2 3 4 5 6>
) {

    @list.classify( { $_ %% 2 ?? 'even' !! 'odd' }, :into( my %class; ) );

    my @results = %class{'even'}.sort({ $^a <=> $^b });
    @results.push(| %class{'odd'}.sort({ $^a <=> $^b }) );

    say q{(}, @results.join(q{,}), q{)};
}
