#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 1;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

sub usage() { qq(echo -e "[1,2] \\n [3,4]" | $0 r c ) }

my $Row = shift;
my $Col = shift;

die 'Usage: '. usage() unless (defined $Row && $Row > 0) && (defined $Col && $Col > 0);

my $input  = readMatrix();
my $output = reshape($input, $Row, $Col);
showMatrix($output);

sub readMatrix()
{
    # Assuming one line per row, square brackets on the ends
    # and possibly separated by commas
    my @matrix;
    while (<>)
    {
        chomp;
        next if m/^\w*$/;   # Ignore blank lines
        s/[[\],]/ /g;       # Leave only numbers
        push @matrix, [ split ' ' ];    # Split on white space
    }
    return \@matrix;
}

sub reshape($matrix, $r, $c)
{
    showMatrix($matrix, "Input") if $Verbose;

    my $origR = scalar(@$matrix);
    my $origC = scalar( $matrix->[0]->@* );

    return 0 if ( ($origR * $origC) != ($r * $c) );

    my @flat = map { $_->@*  } $matrix->@*;

    my @newMatrix;
    push @newMatrix, [ splice(@flat, 0, $c) ] for 1 .. $r;
    showMatrix(\@newMatrix, "Output") if $Verbose;
    return \@newMatrix;
}

sub showMatrix($m, $title = "")
{
    my $row = scalar(@$m);

    say $title;
    for ( my $r = 0 ; $r < $row; $r++)
    {
        say +(' ' x length($title)), "[ ", join(", ", $m->[$r]->@*), " ]";
    }
}

sub runTest
{
    use Test2::V0 -srand => 1;

    is( reshape( [ [1,2] ], 3, 2 ), 0, "Example 3");

    is( reshape([ [1,2], [3,4] ], 1, 4), [ [ 1,2,3,4 ] ] , "Example 1");

    is( reshape( [ [1,2,3], [4,5,6] ], 3, 2) , [ [1,2],[3,4],[5,6] ], "Example 2");

    done_testing;
}

