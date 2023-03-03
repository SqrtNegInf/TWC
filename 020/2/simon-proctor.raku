#!/usr/bin/env raku

# 2023-02-16 GH5209 need to use '[+] |' ??

#|Given a starting number (default 0) find the first two Amicable numbers following it.
multi sub MAIN ( Int $start = 0 ) {
    my $current = $start;
    my $pair;
    loop {        
        $current++;
        $pair = first-pair( $current );
        last if $pair;
    }
    say "$pair, $current";

}

sub first-pair( Int $number ) {
   #my $num-total = sum divisors( $number );
    my $num-total = [+] |divisors( $number );
    (1..^$number).first( 
        {
            my $sum = sum divisors( $_ );
           #my $sum = [+] |divisors( $_ );
            ($sum == $number && $num-total == $_) 
        }
    )
}

sub divisors( Int $number ) is pure {
    state @divs;
    my $mid = $number div 2;
    @divs[$number] //= (1..$mid).grep( $number %% * ).list;
}
