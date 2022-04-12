#!/usr/bin/env perl


use strict;
use warnings;
use POSIX;

sub is_pallindrome{

my $original_string = shift;
my $rev_string = reverse $original_string;

if ($original_string == $rev_string){
	print "$original_string\n";
}

}

my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst);
my $epoch = time();
my $yrs30 = (30 * 365 * 24 * 60 * 60)+(7 * 24 * 60 * 60);
my $jan0100 = localtime($yrs30);

my $date_string = strftime "%m%d%Y", localtime($yrs30);
##my $this_date_string = strftime "%d%m%Y", localtime;
my $this_date_string = "12312999";
for (my $index=1;$date_string != $this_date_string; $index++){
	#print "Checking $date_string\n";
	is_pallindrome($date_string);
	$date_string = strftime "%m%d%Y", localtime($yrs30+($index * 24 * 3600));
}
