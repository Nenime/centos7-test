import sys
f = open('files/out.txt', 'w')

#check
try:
	import NONE
except:
	print('Checked')


#scipy test
try:
	import scipy
	print('Scipy: OK')
	f.write('Scipy: OK\n')

except:
	print('Scipy: Failed')
	f.write('Scipy: Failed\n')

#pygraphviz test
try:
	import pygraphviz
	print('Pygraphviz: OK')
	f.write('Pygraphviz: OK\n')

except:
	print('Pygraphviz: Failed\n')
	f.write('Pygraphviz: Failed\n')

