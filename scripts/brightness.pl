#!/usr/bin/perl
open V, "</sys/class/backlight/intel_backlight/brightness";
my $light = <V>;
chomp $light;
close V;
my $do = shift;

if($do eq '-') {
  $light -= 250;
}
else {
  $light += 250;
}

open V, ">/sys/class/backlight/intel_backlight/brightness";
print V "$light\n";
close V;

print "current: $light\n";
