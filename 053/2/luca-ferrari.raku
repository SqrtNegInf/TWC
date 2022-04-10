#!/usr/bin/env raku

sub MAIN( Int:D $size where { 1 < $size <= 5 } = 2 ) {
    say "Requested string length is $size ";
    my @vowels = 'a', 'e', 'i', 'o', 'u';

    # build a matrix with all the possibile combinations
    my @combinations = @vowels;
    for 1 ..^ $size {
        @combinations = @combinations [X] @vowels;
    }



    for @combinations -> @letters {
        my $string = @letters.join;
        my $ok = True;

        # test if all but the last letters do match the regular expression
        loop ( my $i = 0; $i < @letters.elems - 1; $i++ ) {
            my $letter = @letters[ $i ];
            $ok = do 
                given $letter {
                    when 'a' { $string ~~ / a (e | i) / }
                    when 'e' { $string ~~ / ei / }
                    when 'i' { $string ~~ / i ( a | e | o | u ) / }
                    when 'o' { $string ~~ / o ( a | u ) / }
                    when 'u' { $string ~~ /u ( o | e ) / }
            }.so;

            # if not ok, do not continue
            last if ! $ok;
        }

        say "Found { ~@letters }"; # if $ok;
    }

}
