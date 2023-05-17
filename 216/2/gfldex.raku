#!/usr/bin/env raku
# from: https://gfldex.wordpress.com/2023/05/17/plucking-strings/

class Plucked {
    has $.str;
    has @.chars;

    method new(Str:D $s) { callwith  :str($s), :chars($s.comb) }
    method gist { $!str ~ ' ' ~ @!chars.pairs».&{ .key ~ ' ' ~ .value } }
    method Str { $.str }
    method Set { @.chars.Set }
    method AT-POS($pos) { @.chars.AT-POS($pos) }
    method AT-KEY($key) { @.chars.grep( * eq $key ) }
}

constant PC = Plucked(Str:D);

for [
    ('perl','raku','python'), 'peon';
    ('love','hate','angry'), 'goat';
    ('come','nation','delta'), 'accommodation';
    ('come','country','delta'), 'accommodation'
] -> [ @stickers, PC $word ] {
    my @keep;
    for @stickers -> PC $sticker {
        @keep.push($sticker) if $word ∩ $sticker;
    }
    if ([∪] @keep) ⊇ $word {
        put „"$word" can be made with "$@keep"“;
    } else {
        my $missing = $word ∖ ([∪] @keep);
        put „"$word" can not be made, "$missing" is missing“;
    }
}
