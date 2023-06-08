#!/usr/bin/env perl
use v5.36;

say last_word('  hello world',                "[ea]l");        # 'hello'
say last_word("Don't match too much, Chet!",  qr/ch.t/i);      # 'Chet!'
say last_word("spaces in regexp won't match", qr/in re/);      #  undef
say last_word( join(' ', 1..1e6),             qr/^(3.*?){3}/); # '399933'

sub last_word{
  my ($str,$regExp)=@_;
  $regExp=qr/$regExp/ unless (ref $regExp =~/Regexp/);
  foreach my $word (reverse split /\s+/, $str){
    return $word if $word=~m/$regExp/
  } 
}

