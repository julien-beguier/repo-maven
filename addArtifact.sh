#!/bin/sh
if [ "$#" -ne 4 ]; then
  echo "Usage: $0 <jar_file(without_extension)> <group_id> <artifact_id> <version> [-clean/-noclean] [-push/-nopush]" >&2
else
    if [ -f $1.jar ]; then
	echo "\n--------------------------"
	echo "\n-- Deploying $3 library --"
	echo "\n--------------------------"
	src=""
	javadoc=""
	if [ -f $1-sources.jar ]; then
	    src=-Dsources=$1-sources.jar
	fi
	if [ -f $1-javadoc.jar ]; then
	    javadoc=-Djavadoc=$1-javadoc.jar
	fi
	mvn deploy:deploy-file -Durl=file://$PWD -Dfile=$1.jar $src $javadoc -DgroupId=$2 -DartifactId=$3 -Dpackaging=jar -Dversion=$4
	
	if [ ! "$6" == "-noclean" ]; then
	    echo "\n--------------"
	    echo "\n-- Cleaning --"
	    echo "\n--------------"
	    rm -vf $1.jar $1-sources.jar $1-javadoc.jar
	fi

	if [ ! "$7" == "-nopush" ]; then
	    echo "\n----------------------"
	    echo "\n-- Adding new files --"
	    echo "\n----------------------"
	    git add -Av .
	    
	    echo "\n------------------"
	    echo "\n-- Commiting $3 --"
	    echo "\n------------------"
	    git commit -m "Add $3 to maven repo"
	    
	    echo "\n-----------------------"
	    echo "\n-- Pushing on server --"
	    echo "\n-----------------------"
	    git push -u origin master
	fi
    else
		echo "File not found : $1.jar"
    fi
fi
