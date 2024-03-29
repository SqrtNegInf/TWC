#!/usr/bin/env perl
use v5.36;

use Getopt::Long qw(:config no_ignore_case);
use Pod::Usage;

srand 1;

sub read_row_ {
    my @buffer = @{$_[0]};
    my $line = <STDIN>;
    chomp $line if defined $line;
    push @buffer, $line;
}

sub get_row_ {
    my $buffer = $_[0];
    shift @{$buffer};
}

sub gen_rows_of_string {
    my ( $R, $C ) = @_;

    # note: as the name of subroutine say
    #      I only use the "the list in string form" on this challenge.
    #     e.g) '[0, 0, 1]', '[1, 1, 0] ... '

    # reduce the occurence of zero on the same matrix
    my $max_chance = int( $R / 2 );

    my @result;
    for ( 1..$R ) {
        push @result,
            '['.
              join( ", ",
                    map {
                        if ( $max_chance > 0 and $_ < 2 )  {
                            # [  0, 1  ] --> 0
                            # [ others ] --> 1
                            # only when max_chance left
                            --$max_chance;
                            0;
                        }
                        else {
                            1;
                        }
                    }
                    map { int(rand(10)) } 1..$C ).
              ']';
    }
    return @result;
}

my @row_raw;
my $round = 1;
my $use_random = 1;
my $read_from_stdin = 0;
my $R = 3;
my $C = 3;
my $help = 0;
my $man  = 0;

GetOptions( "round=i"     => \$round,
            "stdin"       => sub { $read_from_stdin = 1, $use_random = 0 },
            "rows|R=i"    => \$R,
            "columns|C=i" => \$C,
            "help"        => \$help,
    ) or pod2usage(2);

pod2usage( -exitval => 0, -verbose => 2 ) if $help;

unless ( $use_random and $R > 2 and $C > 2 ) {
    die "Invalid Rows($R) or Columns($C): both should be greater than 2";
}

if ( $use_random ) {
    $round = 2;
    for ( 1..$round ) {
        push @row_raw, $_ for gen_rows_of_string( $R, $C );
        push @row_raw, undef; # indicate end of the row
    }

}

{
    my ( @row_whole_zero_flag,  $row_some_zero_str );

    #print STDERR ( "Input:\n" );
    read_row_( \@row_raw ) unless $use_random;
    ( $row_some_zero_str = $row_raw[0] ) =~ s/0/1/g;

    while ( defined( my $r_raw = get_row_( \@row_raw ) ) ) {
        my $new_row_some_zero_str = $row_some_zero_str &. $r_raw;
        push @row_whole_zero_flag, !!( index( $r_raw, "0" ) > 0 );
        $row_some_zero_str = $new_row_some_zero_str;
        read_row_( \@row_raw ) unless $use_random;
        #print STDERR $r_raw.$/;
    }

    ( my $row_whole_zero_str = $row_some_zero_str ) =~ s/1/0/g;

    #print STDERR ( "Output:\n" );
    print( ( $_ ? $row_whole_zero_str : $row_some_zero_str ).$/ )
      for @row_whole_zero_flag;
    print $/;
    redo if ( --$round ) > 0;
}
