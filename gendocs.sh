#!/bin/bash

echo "# Core packages" > core/README.md
echo >> core/README.md
rm -f core/*/README.md
echo "# Standard Library Packages" > stdlibs/README.md
echo >> stdlibs/README.md
rm -f stdlibs/*/README.md
echo "# Extended Library Packages" >  extlibs/README.md
echo >>  extlibs/README.md
rm -f extlibs/*/README.md
for i in `ls -d ../src/github.com/io-core/*`; do 
	for j in `ls $i/*.Pkg 2>/dev/null`; do 
		k=`grep '^doc' $j | awk -F',' '{print $2}'`
		w=`grep '^doc' $j | awk -F',' '{print $3}'`
		ref=`echo $j | sed -e 's/...src.github.com.io-core.\(.*\).Pkg/\1/g'` 
		nam=`echo $ref | awk -F'/' '{print $1}'` 
		#echo "$nam $ref $k $j $i"
		echo "[$nam](./$nam/README.md) $w" >> $k/README.md
		echo >> $k/README.md
		echo "The [$nam](./$nam/README.md) package $w" >> $k/$nam/README.md
		echo >> $k/$nam/README.md
		for l in `grep '^p,' $j | awk -F',' '{print $2}'`; do
			snam=`echo $l | sed -e 's/\(.*\).Mod/\1/g'`
			echo  >> $k/$nam/README.md
			echo "#### [MODULE $snam](https://github.com/io-core/$nam/blob/main/$snam.Mod)" >> $k/$nam/README.md
			 >> $k/$nam/README.md
			echo "##### Procedures:" >> $k/$nam/README.md
			echo "../src/github.com/io-core/$nam/$snam.Mod" 
			for p in `grep "PROCEDURE" ../src/github.com/io-core/$nam/$snam.Mod | grep '*;\|*(' | sed -e 's/ *PROCEDURE \(.*\);/\1/g'|tr ' ' '~'`; do
				echo "* `echo $p | tr '~' ' '`" >> $k/$nam/README.md
				
			done
		done
	done
done