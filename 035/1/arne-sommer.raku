#!/usr/bin/env raku

#use lib "lib";
#use BinaryMorse2;

class BinaryMorse {

our %morse =
(
   A  => '.-',
   B  => '-...',
   C  => '-.-.',
   D  => '-..',
   E  => '.',
   F  => '..-.',
   G  => '--.',
   H  => '....',
   I  => '..',
   J  => '.---',
   K  => '-.-',
   L  => '.-..',
   M  => '--',
   N  => '-.',
   O  => '---',
   P  => '.--.',
   Q  => '--.-',
   R  => '.-.',
   S  => '...',
   T  => '-',
   U  => '..-',
   V  => '...-',
   W  => '.--',
   X  => '-..-',
   Y  => '-.--',
   Z  => '--..',
   0  => '-----',
   1  => '.----',
   2  => '..---',
   3  => '...--',
   4  => '....-',
   5  => '.....',
   6  => '-....',
   7  => '--...',
   8  => '---..',
   9  => '----.',
  '.' => '.-.-.',
  ',' => '--..--'
);

our %remorse = %morse.antipairs;

our %binary-morse;

for %morse.kv -> $char, $value
{
  %binary-morse{$char} = $value.comb.map({ $_ eq '.' ?? '1' !! '111' }).join('0');
}

our %binary-remorse = %binary-morse.antipairs;

}

class BinaryMorse2 {

my %morse =
(
   A  => '.-',
   B  => '-...',
   C  => '-.-.',
   D  => '-..',
   E  => '.',
   F  => '..-.',
   G  => '--.',
   H  => '....',
   I  => '..',
   J  => '.---',
   K  => '-.-',
   L  => '.-..',
   M  => '--',
   N  => '-.',
   O  => '---',
   P  => '.--.',
   Q  => '--.-',
   R  => '.-.',
   S  => '...',
   T  => '-',
   U  => '..-',
   V  => '...-',
   W  => '.--',
   X  => '-..-',
   Y  => '-.--',
   Z  => '--..',
   0  => '-----',
   1  => '.----',
   2  => '..---',
   3  => '...--',
   4  => '....-',
   5  => '.....',
   6  => '-....',
   7  => '--...',
   8  => '---..',
   9  => '----.',
  '.' => '.-.-.',
  ',' => '--..--',
  '?' => '..--..'
);

my %remorse = %morse.antipairs;

my %binary-morse;

for %morse.kv -> $char, $value
{
  %binary-morse{$char} = $value.comb.map({ $_ eq '.' ?? '1' !! '111' }).join('0');
}

my %binary-remorse = %binary-morse.antipairs;

constant unknown = '?';

our sub morsify (Str $text)
{
  my @words;
  
  for $text.split(/\s+/) -> $word
  {
    my @new-word;
    for $word.comb -> $character
    {
      @new-word.push(%binary-morse{$character} // %binary-morse{$character.uc} // %binary-morse{unknown} );
    }
    @words.push(@new-word.join('000'));
  }

  return @words.join("0000000");
}

subset BinaryMorse of Str where * ~~ /^<[01]>*$/;

our sub demorsify (BinaryMorse $text)
{
  my @words;

  for $text.split("0000000") -> $word
  {
    my $new-word = "";
    for $word.split("000") -> $character
    {
      $new-word ~= %binary-remorse{$character} //unknown;
    }
    @words.push($new-word);
  }
  return @words.join(" ");
}

}

multi sub MAIN (BinaryMorse2::BinaryMorse $binary-morse)
{
  say BinaryMorse2::demorsify($binary-morse);
}

#`{{  compilation error for this block
multi sub MAIN (:$binary where $binary.IO.f && $binary.IO.r)
{
  my $fh = open $binary, :bin;
  my $data = $fh.read;
  $fh.close;

  my $result = "";
  $result ~= $_.base(2).fmt("%08d") for @($data);

  $result.substr-rw(0,1) = "" while $result.chars && $result.substr(0,1) eq "0";
  
  say BinaryMorse2::demorsify($result);
}
}}

multi sub MAIN (Str $text = 'SOS', :$roundtrip = True, :$binary)
{
  if $binary
  {
    if my $fh = open $binary, :w, :bin
    {
      my @values = BinaryMorse2::morsify($text).parse-base(2).polymod(256 xx 200).reverse;
      @values.shift while @values && @values[0] == 0;
      die "Set a higher polymod value" if @values[0] > 255;
      $fh.write: Blob.new(@values);
      $fh.close;

      MAIN(:$binary) if $roundtrip;
    }
    else
    {
      die "Unable to open file $binary";
    }
  }
  
  else
  {
    my $encoded = BinaryMorse2::morsify($text);
    say $encoded;
    say BinaryMorse2::demorsify($encoded) if $roundtrip;
  }
}
