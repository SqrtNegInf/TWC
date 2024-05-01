#!/usr/bin/env raku

sub MAIN(
    Str $line1  = 'Mango is sweet',
    Str $line2  = 'Mango is sour'
) {
    my @words1 = $line1.words.Bag.grep({ $_.value == 1; }).map({ $_.key });
    my @words2 = $line2.words.Bag.grep({ $_.value == 1; }).map({ $_.key });

    say q{(}, ((@words1 ⊖ @words2).map({ "'{$_.key}'" }).sort.join(q{, }) || "''"), q{)};
}
