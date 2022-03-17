#!/bin/bash
#
COMMON=`head -n -1 g.mcrl2`
G8='G8));'
L8='L8));'
G9='G9));'
L9='L9a||L9b||L9p||L9q));'
G6='G6));'
L6='L6a||L6b||L6p||L6q));'

# build lts
echo "${COMMON}\n${G6}"|mcrl22lps -lregular2 |tee g6.lps|lps2lts - g6.lts
echo "${COMMON}\n${L6}"|mcrl22lps -lregular2 |tee l6.lps|lps2lts - l6.lts
echo "${COMMON}\n${G8}"|mcrl22lps|lps2lts - g8.lts
echo "${COMMON}\n${L8}"|mcrl22lps|lps2lts - l8.lts
echo "${COMMON}\n${G9}"|mcrl22lps|lps2lts - g9.lts
echo "${COMMON}\n${L9}"|mcrl22lps|lps2lts - l9.lts

# model check for bisimulation
echo ' '
echo 'checking bimulation of G5 with projections:'
ltscompare -ebisim g5.lts l5.lts
ltscompare -eweak-bisim g5.lts l5.lts
echo ' '
echo 'checking bimulation of G8 with projections:'
ltscompare -ebisim g8.lts l8.lts
ltscompare -eweak-bisim g8.lts l8.lts
echo ' '
echo 'checking bimulation of G9 with projections:'
ltscompare -eweak-bisim g9.lts l9.lts


