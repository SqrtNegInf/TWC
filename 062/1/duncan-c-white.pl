#!/usr/bin/env perl
use v5.36;

use Getopt::Long;

my $unique = 0;
my $caseinsensitive = 0;

my @addr;
while( <DATA> )
{
	chomp;
	s/\s+//g;
	die "bad input $_\n" unless /@/;
	push @addr, $_;
}

sub compare
{
	my( $aname, $adom ) = split( /@/, $a, 2 );
	my( $bname, $bdom ) = split( /@/, $b, 2 );

	# compare domains first, case insensitively
	$adom = lc($adom);
	$bdom = lc($bdom);
	return $adom cmp $bdom if $adom ne $bdom;

	# now compare names, case insensitively if $caseinsensitive
	if( $caseinsensitive )
	{
		$aname = lc($aname);
		$bname = lc($bname);
	}
	return $aname cmp $bname;
}

#
# my $out = sanitize( $in );
#	Sanitize the email address $in, giving $out.
#	Sanitizing means:
#	- lowercasing every domain, because domains are case insensitive
#	- lowercasing every name IF $caseinsensitive
#
sub sanitize( $in )
{
	my( $name, $dom ) = split( /@/, $in, 2 );
	$dom = lc($dom);
	$name = lc($name) if $caseinsensitive;
	return $name.'@'.$dom;
}


my %seen;
@addr = grep { ! $seen{sanitize($_)}++ } @addr if $unique;
@addr = sort compare @addr;

say for @addr;

__END__
name@example.org
rjt@cpan.org
Name@example.org
rjt@CPAN.org
user@alpha.example.org
