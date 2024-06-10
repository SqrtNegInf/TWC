#!/usr/bin/env raku

#sub MAIN( Str $ip is copy
#	  where { $ip ~~ /^ ( \d ** 1..3 '.' ) ** 3 \d ** 1..3  / } ) {

    my $ip = "1.1.1.1";
    $ip .= subst( '.', '[.]', :g );
    $ip.say;
#}
