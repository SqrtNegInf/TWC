#!/usr/bin/env perl
use v5.36;

'17:50' =~ m{(?<hour>\d{2}):(?<minute>\d{2})(?:\s+)?(?<am_pm>am|pm)?};

unless (exists $+{am_pm}){
if($+{hour} lt '12'){
  say $+{hour}, ':', $+{minute}, 'am';
}elsif($+{hour} gt '12'){
  my $temp = $+{hour} - 12;
  say '0', $temp, ':', $+{minute}, 'pm';
}elsif($+{hour} eq '12'){
  say $+{hour}, ':', $+{minute}, 'pm';
}elsif($+{hour} eq '00'){
  say $+{hour}, ':', $+{minute}, 'am';
}
}else{
  if($+{hour} lt '12' && $+{am_pm} eq 'am'){
    say $+{hour}, ':', $+{minute};
  }elsif($+{hour} lt '12' && $+{am_pm} eq 'pm'){
    my $temp = $+{hour} + 12;
    say $temp, ':', $+{minute};
  }elsif($+{hour} eq '12' && $+{am_pm} eq 'am'){
    say '00', ':', $+{minute};
  }elsif($+{hour} eq '12' && $+{am_pm} eq 'pm'){
    say $+{hour}, ':', $+{minute};
  }
}
