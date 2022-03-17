#!/bin/perl
# testsuite for model checking  our global protocols
#
# 
$prog = `head -n -1 g.mcrl2`;

# global language tests
for (0..15) {
  $i = $_;
  print "Test G$i: ";
  open(my $FH, '|-', 'mcrl22lps -lregular2|lps2pbes --formula=g.mcf|pbes2bool')
    or die "could not open pipe";
  print $FH $prog;
  print $FH "G$i));";
  close($FH);
}
