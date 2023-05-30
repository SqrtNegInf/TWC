#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
#use Function::Parameters;

my $debug=0;
my $test=1;
die "Usage: unique-subsequnces [--test] [--debug]\n".
    "Or...  unique-subsequnces [--debug] S T\n"
	unless GetOptions( "debug" => \$debug, "test" => \$test )
	    && ($test && @ARGV==0 || !$test && @ARGV==2);

if( $test )
{
	dotests();
	exit 0;
}

my( $s, $t ) = @ARGV;
my @match = find_the_ways( $s, $t );
my $nways = @match;
say "Input: s=$s, t=$t";
say "Output: $nways";
foreach my $mn (0..$#match)
{
	say( '    ' . ($mn+1) . ': ' . explain_matchtag($t,$match[$mn]) );
}

#
# my @match = find_the_ways( $s, $t );
#	Find all different ways that $s can contain the chars in $t
#	in that order.  For each way that we find, generate a match tag, a
#	string like $s, but in which every position in the tag that matches a
#	char in $t replaced with a '.'.
#	Return a list of all different completed matchtags.
#
sub find_the_ways( $s, $t )
{
	return consider_her_ways( $s, 0, $t, $s );
}



#
# my @match = consider_her_ways( $s, $spos, $t, $matchtag );
#	Find all different ways that $s (starting at pos $spos)
#	contains the chars in $t in that order; $matchtag is the "match tag"
#	so far, this starts as a copy of $s, in which every previously matched
#	char from $t has been replaced with a '.'.
#	Return a list of all different completed matchtags.
#
sub consider_her_ways( $s, $spos, $t, $matchtag )
{
	return ( $matchtag ) if $t eq '';
	my $firstlet = substr($t,0,1);
	my $t2 = substr($t,1);
	my $call = "ctw( $s, $t, let:$firstlet, spos:$spos, mt:$matchtag )";
	my @pos = grep { substr($s,$_,1) eq $firstlet } $spos..length($s)-1;
	say "$call: pos of $firstlet = ".join(',',@pos) if $debug;
	my @result;
	foreach my $pos (@pos)
	{
		say "$call: trying pos $pos" if $debug;
		my $m2 = $matchtag;
		substr($m2,$pos,1,'.');
		say "$call: new matchtag=$m2" if $debug;
		my $sp2 = $pos+1;
		my @m = consider_her_ways( $s, $sp2, $t2, $m2 );
		#say "$call: returned from try pos $pos, sp2=$sp2, ways ".join(',',@m)
		#	if $debug;
		#say "$call: adding to result" if $debug;
		push @result, @m;
	}
	say "$call: returning ". join(',',@result) if $debug;
	return @result;
}


#
# my $s = explain_matchtag($t,$tag);
#	Given a $t str like "lon", and a match tag like "..ndo.",
#	build a pretty explanation string "[lon] ndo [n]".
#
sub explain_matchtag( $t, $tag )
{
	my @let = split(//,$t);	# split t into letters eg 'l', 'o', 'n'..
	my $result = $tag;
	foreach my $letter (@let)
	{
		$result =~ s/\./[$letter]/;
	}
	$result =~ s/\]\[//g;	# collapse multiple [a][b][c] to [abc]
	$result =~ s/\]/] /g;	# add a space after every ]
	$result =~ s/\[/ [/g;	# add a space before every [
	$result =~ s/^\s+//;	# ok, that added spaces at start and end;
	$result =~ s/\s+$//;	# remove them..
	return $result;
}


#
# dotests();
#	Do a load of tests.
#
sub dotests()
{
	eval "use Test::More"; die $@ if $@;

# format of each test: F:s:t:mt1,mt2.. or E:tag:t:explanation
my @tests = (
	"F:london:lon:...don,..ndo.,.ond..",
	"E:...don:lon:[lon] don",
	"E:..ndo.:lon:[lo] ndo [n]",
	"E:.ond..:lon:[l] ond [on]",
	"F:littleit:lit:...tleit,..t.leit,..ttlei.,.ittle..,litt.e..",
	"E:...tleit:lit:[lit] tleit",
);

	say "dotests() entry" if $debug;
	say "dotests(): tests=". Dumper(\@tests) if $debug;
	foreach my $test (@tests)
	{
		say "test $test" if $debug;
		my( $type, $rest ) = split( /:/, $test, 2 );
		if( $type eq "F" )
		{
			my( $s, $t, $mts ) = split( /:/, $rest );
			my @m = split(/,/, $mts);
			my $nmatches = @m;

			my @found = find_the_ways( $s, $t );
			my $nfound = @found;

			my $fin = "ctw($s,$t)";
			is( $nmatches, $nfound, "$fin: matches = $nmatches" );
			foreach my $pos (0..$nfound-1)
			{
				is( $found[$pos], $m[$pos],
					"$fin: match(pos)=$m[$pos]" );
			}
		} elsif( $type eq "E" )
		{
			my( $tag, $t, $explanation ) = split( /:/, $rest );
			my $got = explain_matchtag($t,$tag);
			is( $got, $explanation, "explanation(tag=$tag,t=$t)=$explanation" );
		}
	}
	done_testing();
	say "dotests() exit" if $debug;
}
