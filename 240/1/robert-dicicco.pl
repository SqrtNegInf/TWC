#!/usr/bin/env perl
use v5.36;

my @mystr = (["Perl", "Python", "Pascal"],["Perl", "Raku"],["Oracle", "Awk", "C"]);
my @mychk = ("ppp","rp","oac");
my $cnt = 0;

sub GetFirstLetters($wds) {
    my $acronym = "";
    for my $w (@$wds) {
        $acronym .= lc(substr($w,0,1));
    }
    return $acronym;

}

for my $str (@mystr){
    say "Input: \@str = [@$str]";
    say "\$chk = \"$mychk[$cnt]\"";
    my $retval = GetFirstLetters($str);
    $retval eq $mychk[$cnt] ? say "Output: true\n" : say "Output: false\n";
    $cnt++;
}
