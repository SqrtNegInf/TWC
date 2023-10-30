#!/usr/bin/env raku

my @words = ("Perl", "Python", "Pascal");
my $checkstr = 'ppp';
my $compare ;
for @words -> $word {
   $compare ~= $word.lc.substr( 0 , 1 ) ;
}
say ( $checkstr eq $compare ) ;
