#!/usr/bin/env perl
use v5.36;

my $text = shift || "ATTACKATDAWN";
my $key = shift  || "LEMON";
my $encrypt = shift;
$encrypt = (defined $encrypt) ? -1 : 1; #default to encrypt mode

my @m = split(//,$text);
my @k = split(//,$key);
my $OFFSET = 65; #offset index by 65, the ASCII value of A, in effect creating the tabula recta

my $out;
my $i = 0;
foreach my $m (@m) {
	my $k = $k[$i];
	$i = ($i < @k-1) ? $i+1 : 0; #repeat key chars if key is shorter than the input text
	my $c = (unpack("C*",$m) + $encrypt * unpack("C*",$k)) % 26; #we add if encrypt, subtract if decrypt
	$out .= pack("C*", $c+$OFFSET) ;
}
say $out;

__END__

./ch2.pl ATTACKATDAWN LEMON 
LXFOPVEFRNHR
./ch2.pl LXFOPVEFRNHR LEMON 1
ATTACKATDAWN

./ch2.pl THESECRETCODISHELLOWORLD PASSPHRASEISPERLRULESTHEDAY 
IHWKTJIELGWVXWYPCFZAGKSH
./ch2.pl IHWKTJIELGWVXWYPCFZAGKSH PASSPHRASEISPERLRULESTHEDAY 1
THESECRETCODISHELLOWORLD

