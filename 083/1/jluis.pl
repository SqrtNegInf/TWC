#!/usr/bin/env perl
use v5.36;

# perl -ne's/^\W*\w+(.*)\b\w+\W*$/$1/;s/\s//g;print length;print qq(\n);'

say 'way off with multi-byte';

my $S = 'Markmið lífs okkar er að vera hamingjusöm';

if ($S =~ /^\W*\w+(.*)\b\w+\W*/) {
	$_ = $1;
	if (/\w/){
	       s/\s//g;
	       say length ;
	       exit;
       }
}
say "The string sould contain 3 or more words";
