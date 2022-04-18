#!/usr/bin/env raku
my $m=(1..12)>>.fmt("%02d").join("|");
my $d=(1..31)>>.fmt("%02d").join("|");

for ('2230120') {
	if /(1|2)(<[0..9]>**2)(<$m>)(<$d>)/ { 
		put "Input $_ OK";
		put ($0==1??"20$1"!!"19$1",$2,$3).join("-");
		next;
	}
	print "Input $_ invalid";
}

