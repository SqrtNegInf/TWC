#!/usr/bin/env raku

sub MAIN(@strings = <aaa bob ccc ddd>) {
    my %results;

    for (@strings) -> $string {
        my @values = $string.comb.map({ $_.ord - 'a'.ord; });
        my @diff;

        for 1 ..^ @values.elems -> $i {
            @diff.push(@values[$i] - @values[$i - 1]);
        }
        %results{@diff.join(q{,})}.push($string);
    }

    %results{%results.keys.grep({ %results{$_}.elems == 1; })}.Str.say;
}
