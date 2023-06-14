#!/usr/bin/env perl
use v5.36;

sub ter {
  my @m;
  my $n = shift;
  while ($n) {
    push @m, $n % 3;
    $n = int($n/3);
  }
  return @m;
}

sub modify_string {
    my ($in, $mod) = @_;
    my @mods = ter($mod);
    # if @m vector has more than needed elements, return undef
    return undef if length($in) < @mods + 1;
    my $result = '';
    for my $d (split '', $in) {
        my $m = (shift @mods) // 0;             # undefs at the end mean empty inter-digit appends
        $result .= $d . ('', ' + ', ' - ')[$m]; # just peek what to insert according to $m
    }
    return $result;
}

my ($input, $target) = ('123456789', 100);
die "Usage; $0 <input number> <target sum>" unless $input =~ /^\d+$/ && $target =~ /^-?\d+$/;
say "Found answer(s):";
my $n = 0;
while (defined (my $x = modify_string ($input, $n))) {
  say "$target = $x" if eval $x == $target;
  $n++;    
}
