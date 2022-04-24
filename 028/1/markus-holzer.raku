#!/usr/bin/env raku

# was giving wrong answer due to overly specific regex

sub MAIN( $file =$*PROGRAM-NAME )
{
    my $magic = run( "file", $file, :out ).out.slurp;
    say $magic;
    say "The file content is ", ($magic ~~ / text / ?? "ascii" !! "binary");
}
