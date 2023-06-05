#!/usr/bin/env perl
use v5.36;

use Getopt::Long;

use lib ".";
use WordSearch;

sub Usage { "Usage: $0 [-l min-length] grid-file wordlist-file" };

my $MinLength = 5;
my $Verbose = 1;
GetOptions('length=i' => \$MinLength, "verbose!" => \$Verbose);

my($gridFile, $wordlistFile) = ('grid.txt', 'words.txt');

die Usage() unless $gridFile && $wordlistFile;
die ( Usage(). " $!" ) unless -r $gridFile;
die ( Usage(). " $!" ) unless -r $wordlistFile;

die Usage() unless ( $MinLength > 0 && $MinLength < 50 );

my $wordsearch = WordSearch->new();
$wordsearch->loadGrid($gridFile);
$wordsearch->loadWordlist($wordlistFile, $MinLength);

my $result = $wordsearch->run();

my $count = $wordsearch->numFound();
my $foundList = $wordsearch->foundList();
say "Found $count words of length $MinLength or longer";
if ( $Verbose )
{
    say "[" . ($_+1) ."] $foundList->[$_]" for 0 .. $count-1;
}
