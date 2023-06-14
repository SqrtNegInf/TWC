#!/usr/bin/env perl
use v5.36;


my $goal = shift // 100;

my $str = "123456789";

my @ch = ('', '+', '-' );

my $ip = 1;		# insertion point in string

mutate( $str, 1, 8, $goal );

#
# mutate( $str, $ip, $nleft, $goal );
#	Given a string $str, an insertion point $ip (1..length($str)-1)
#	and a number of recursions left ($nfleft), mutate the string in
#	all possible ways, inserting each sequence in @ch into $str at $ip,
#	then recursing.  Search for cases where eval(mutatedstr)==$goal,
#	printing them out.
#
sub mutate( $str, $ip, $nleft, $goal )
{
	foreach my $a (@ch)
	{
		my $s2 = $str;
		substr( $s2, $ip, 0, $a );
		#say "str:$str, a:$a, ip:$ip, nleft:$nleft, s2:$s2";
		my $ip2 = $ip+1+length($a);
		if( $nleft>1 )
		{
			mutate( $s2, $ip2, $nleft-1, $goal );
		}
		if( $nleft==1 )
		{
			my $n = eval $s2;
			say "FOUND $s2" if $n==$goal;
		}
	}
}
