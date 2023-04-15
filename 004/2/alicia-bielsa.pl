#!/usr/bin/env perl
use v5.36;
#use strict;
#use warnings;

my $fileWithWords = 'words';
my @aWordsFromFile = readLinesFromFile($fileWithWords);

#Letters must be lowercase
my @aListOfLetters = <c r a t e>;
my %hLettersAvailable = arrayToHash( \@aListOfLetters );


foreach my $wordFromFile (@aWordsFromFile){
    if (canWordBeMade( $wordFromFile )){
     print "$wordFromFile\n";
    }
}

sub readLinesFromFile {
  my $file = shift;
  my @aLines =();
  unless ( -f $file) {
    die "ERROR: File '$file' does not exist\n";
  }
  open (my  $fh, '<', $file) or die "ERROR: Unable to open file '$file':'$!'\n";
  while (my $line = <$fh>) {
    $line =~ s%^\s+%%;
    $line =~ s%\s+$%%;
    next unless ($line);
    push (@aLines,lc($line));
  }
  close ($fh);
  return @aLines ;

}

sub arrayToHash {
  my $refArray = shift;
  my %hHash = ();
  foreach my $item (@{$refArray}){
    if (exists($hHash{$item})){
    	$hHash{$item} ++;
    } else {
        $hHash{$item} = 1;
    }
  }
  return %hHash;
}

sub canWordBeMade {
    my $wordToCheck = shift;
    my $canBeMade = 0;
    my %hLettersToUse = %hLettersAvailable;
    foreach my $letterInWord (split(//, $wordToCheck)){
      if (exists($hLettersToUse{$letterInWord})  && $hLettersToUse{$letterInWord}){
        $hLettersToUse{$letterInWord}--;
      } else {
        return $canBeMade;
      }
    }
    return 1;
}

exit 0;
