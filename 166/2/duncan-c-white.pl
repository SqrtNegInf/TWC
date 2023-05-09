#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
#use Function::Parameters;
use List::Util qw(max);


my $debug=0;

my @dirs = <dir_a dir_b dir_c dir_d>;

my %allset;	# set of all files seen in any dir
my %filesindirs;# mapping of filename -> list of dirs it's in
my %dirwidth;   # map dirname -> max width of any filename

foreach my $dir (@dirs)
{
	opendir(my $dh, $dir) || die "Can't opendir $dir: $!\n";
	my @files = map { -d "$dir/$_" ? "$_/" : $_ }
		    grep { $_ ne "." && $_ ne ".." }
		    readdir($dh);
	$allset{$_}++ for @files;
	foreach my $file (@files)
	{
		$filesindirs{$file} //= [];
		my $aref = $filesindirs{$file};
		push @$aref, $dir;
	}
	$dirwidth{$dir} = max map { length($_)+1 } @files;
	closedir $dh;
}

my @cells;
my @dashes;
foreach my $dir (@dirs)
{
	my $w = $dirwidth{$dir};
	push @cells, sprintf( "%-${w}s", $dir );
	push @dashes, ('-' x $w);
}
say join( ' | ', @cells );
say join( '-|-', @dashes );

foreach my $file (sort keys %allset)
{
	my $aref = $filesindirs{$file};
	next if @$aref == @dirs;		# in all dirs
	@cells = ();
	my %indir = map { $_ => 1 } @$aref;	# 
	foreach my $dir (@dirs)
	{
		my $w = $dirwidth{$dir};
		my $str = $indir{$dir} ? $file : ' ';
		$str = sprintf( "%-${w}s", $str );
		push @cells, $str;
	}
	say join( ' | ', @cells );
}
