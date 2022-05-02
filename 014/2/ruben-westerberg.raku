#!/usr/bin/env raku

# produces no output

my $path= 'words';
my $states= any 'states.txt'.IO.lines>>.lc;

my $longest="";
($path.IO.lines>>.lc)
.grep( *.chars %% 2).map({
	my $p= .comb().map(*~*).all;
	$longest =  $_ if  (grep $p, $states) && $_.chars > $longest.chars;
;});
put $longest;
	
