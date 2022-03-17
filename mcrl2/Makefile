model = g

test:  ${model}.pbes
	perl test.pl

bisim: g.mcrl2            # NB: sourcefile and tests hardcoded, bisim of G8 and G9
	sh ./bisim-tests.sh 

check: ${model}.pbes
	pbes2bool ${model}.pbes

sim:   ${model}.lps
	lpsxsim ${model}.lps &

graph: ${model}.lts
	ltsgraph ${model}.lts &

lts:	${model}.lts

${model}.pbes: ${model}.lps ${model}.mcf
	lps2pbes --formula=${model}.mcf ${model}.lps ${model}.pbes

${model}.lts: ${model}.lps
	lps2lts ${model}.lps ${model}.lts

${model}.lps: ${model}.mcrl2
	mcrl22lps -lregular2 ${model}.mcrl2 ${model}.lps
     
clean:
	rm -f ${model}.lps ${model}.lts ${model}.pbes
