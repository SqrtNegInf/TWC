#!/usr/bin/env raku


my @numbers = (1,3,5,6,9);
my $len = @numbers.elems ;
my $am = ([+] @numbers) / $len ;
my $gm = ([*] @numbers) ** ( 1 / $len ) ;
my $hm = $len / ( [+] @numbers.map( { 1 / $_ } )) ;
my @means = ($am, $gm , $hm).map( {sprintf( "%.1f" , $_)} ) ;
my @output = ("AM = " , "GM = " , "HM = ") Z~ @means ;
say @output.join( ", " ) ;
