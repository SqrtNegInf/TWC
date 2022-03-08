#!/usr/bin/env raku

#| Given a list of up to 20 elements find the division of items that has the smallest difference
#sub MAIN( *@N where @N.elems <= 20 ) {
    my @N = 10, -15, 20, 30, -25, 0, 5, 40, -5;;
    my $len = @N.elems div 2;

    my @res = @N.combinations($len).map( -> @a { ( @a, (@N (-) @a).keys ) } )
               .sort(-> (@a,@b) {abs( ([+] @a) - ([+] @b)) } )
               .first;

    "{@res[0].sort.join(',')} <=> {@res[1].sort.join(',')}".say;


#}
