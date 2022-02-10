#!/usr/bin/perl -w

use strict;
use warnings;

my @lines = ();
my $comment = "///";
my $start = 0;

push @lines, "$comment Usage example:\n";
push @lines, "$comment\n";
push @lines, "$comment ```dart\n";

while(my $line = <STDIN>) {
  if ($line =~ /^void main/) {
    $start = 1;
    next;
  }

  if ($start) {
    last if $line =~ /^}/;

    if ($line =~ /^$/) {
      push @lines, "$comment\n";
    } else {
      $line =~ s/^\s{2}//;
      push @lines, "$comment $line";
    }
  }
}

push @lines, "$comment ```\n\n";

print $_ foreach @lines;
