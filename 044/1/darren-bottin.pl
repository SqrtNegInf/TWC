#!/usr/bin/env perl
use v5.36;

my $numlist = $ARGV[1]||'123456789'; # Command line overide, default to 1-9
my @numarray = split('',$numlist);

my @symbols =( ",", '', ",-"); # Split, Join, Negate

my @combination = ( 1,(0) x 8); # Skip over the join option for the first digit

my $solutions_found=0;
while(1) {
    #warn join(",", @combination);
    my $blend='';
    for my $blend_dig (0..8) {
        $blend .= $symbols[$combination[$blend_dig]].$numarray[$blend_dig];
    }

    my $sum =0;
    my @blend_nums = split(',',$blend);
    say "blend: $_" foreach @blend_nums; 
    $_ ne '' and $sum += $_ foreach @blend_nums; # DH work-around 'not numeric'
    my $sumstr = join ('+',@blend_nums);
    $sumstr =~ s/\+-/-/g; # Remove + before -
    # warn "$sumstr == $sum";
    # die if $trial > 10;
    next unless $sum == 100;
    $solutions_found++;
    print "$sumstr = $sum\n";
    }
continue {
    my $next_rc = next_combination();
    last if $next_rc < 0; # Overflow
}

print "$solutions_found solutions found\n";

sub next_combination() {
    # warn "NEXT COMB";
    my $digit =8;
    my $dval = $combination[$digit]++;
    while ( $digit>=0 and $dval >= 2 ) { # carry left
        $combination[$digit]=0;
        $digit--;
        $dval = $combination[$digit]++;
    }
    return $digit;
}
