#!/usr/bin/env perl
use v5.36;

printf( "  x| %3d %3d %3d %3d %3d %3d %3d %3d %3d %3d %3d\n", 1 .. 11 );
printf("---+--------------------------------------------\n");

for ( 1 .. 11 ) {
    my @row = get_row($_);
    printf( "%3d|", $_ );
    map { $_ == 0 ? print "    " : printf( " %3d", $_ ) } @row;
    print "\n";
}

sub get_row {
    my $row = shift;
    my @row = map { $_ < $row ? 0 : $_ * $row } 1 .. 11;
}
