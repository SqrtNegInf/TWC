#!/usr/bin/env raku

sub MAIN( Str $isbn = '978-0-306-40615-7' ) {
    my @digits = $isbn.trans( (/<[ \s \- ]>/  => '') ).comb;
    given @digits.elems {
        when 13 { 
            my $digit-to-check = @digits.pop;
            my $checkdigit = checksum(@digits);
            if $digit-to-check == $checkdigit {
                say "Your checkdigit '$digit-to-check'",
                    " matches our calculated digit '$checkdigit'";
            } else {
                say "Your checkdigit '$digit-to-check'",
                    " does NOT match our calculated digit '$checkdigit'";
            }
        }
        when 12 {
            my $checkdigit = checksum(@digits);
            say "Your checkdigit is '$checkdigit'";
        }
        default { say "Not a valid ISBN: '$isbn'" };
    }
}

sub checksum( @digits where {(.all ~~ /^\d$/) and (@digits.elems == 12 )}) {
    my $checkdigit = (@digits Z* <1 3 1 3 1 3 1 3 1 3 1 3>).sum mod 10;
    return $checkdigit == 0 ?? 0 !! 10 - $checkdigit; 
}
