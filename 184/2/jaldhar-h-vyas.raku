#!/usr/bin/env raku

sub printArray(@array) {

    my @output = @array.map({ q{[} ~ $_.join(q{,}) ~ q{]} });

    return q{[} ~ @output.join(q{, }) ~ q{]};
}

sub MAIN(
    @list = ( 'a 1 2 b 0', '3 c 4 d')
) {
    my @allInts;
    my @allAlphas;

    for @list -> $string {
        $string.split(q{ }).classify({
            if $_ ~~ 0..9 {
                'integer'
            } elsif $_ ~~ $_ ~~ 'a'..'z' {
                    'alpha';
                }
            },
            :as({ $_ ~~ 'a'..'z' ?? "'$_'" !! $_; }),
            :into( my %type )
        );

        if %type{'integer'} {
            @allInts.push(%type{'integer'});
        }
        if %type{'alpha'} {
            @allAlphas.push(%type{'alpha'});
        }
    }

    say printArray(@allInts), ' and ', printArray(@allAlphas);
}
