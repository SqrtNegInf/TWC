#!/usr/bin/env perl
use v5.36;

use DateTime;

my (@guest_book);

my $cmd = shift @ARGV;		# Read command or text string
if(!$cmd) { $cmd = ""; }
if($cmd eq "html") { html(); exit 0; }
elsif($cmd eq "help") { usage(); exit 0; }
else {
	init();
	calculate_light_on();
}

sub init {

  my @guest_book_tmp = (
	[ "Alex"   ,"09:10","09:45" ],
	[ "Arnold" ,"09:15","09:33" ],
	[ "Bob"    ,"09:22","09:55" ],
	[ "Charlie","09:25","10:05" ],
	[ "Steve"  ,"09:33","10:01" ],
	[ "Roger"  ,"09:44","10:12" ],
	[ "David"  ,"09:57","10:23" ],
	[ "Neil"   ,"10:01","10:19" ],
	[ "Chris"  ,"10:10","11:00" ]
  );
  my %date = ( year=>2019,month=>12,day=>16 );
  foreach my $g (@guest_book_tmp) {
    printf("  %8s: %5s - %5s\n", @$g);
    my @tmp;
    my ($inh,$inm) = split(":",$g->[1]);
    my ($ouh,$oum) = split(":",$g->[2]);
    push(@tmp, DateTime->new( %date, hour=> $inh, minute=> $inm ));
    push(@tmp, DateTime->new( %date, hour=> $ouh, minute=> $oum ));
    push(@tmp, $tmp[1] - $tmp[0]);
    push(@guest_book,[@tmp]);
  }
}

sub calculate_light_on {

  my $old   = $guest_book[0];
  my $start = $old->[0];
  my $end   = $old->[1];
  for( my $i=1; $i<=$#guest_book; $i++ ) {
    my $t = $guest_book[$i][1]; 
    if( $t > $end ) { $end = $t; }
  }
  my $dur = $end - $start;
  print "Duration ", $dur->hours, ":", $dur->minutes, " (", $start->hms, " - ", $end->hms, ")\n";
}


