#!/usr/bin/env raku

subset FilePath of Str where *.IO.f;

#| Look in the given dictionary for the longest word that can be made from the given dictionary 
sub MAIN(
    FilePath :$dict = "words"
) {
    my $states = bag( <AL AK AZ AR CA CO CT DE FL GA
                       HI ID IL IN IA KS KY LA ME MD
                       MA MI MN MS MO MT NE NV NH NJ
                       NM NY NC ND OH OK OR PA RI SC
                       SD TN TX UT VT VA WA WV WI WY> );
    my $word = "";
    
    for $dict.IO.words.grep( *.codes %% 2 ) -> $possible {        
        my $check = bag( $possible.uc.comb(/../ ) );
        if $states (>=) $check && $possible.codes > $word.codes {
            $word = $possible;
        }
    }

    say $word;
}
