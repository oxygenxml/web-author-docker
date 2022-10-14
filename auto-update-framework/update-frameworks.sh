#!/bin/bash
echo "Checking for change $(date)"

export LOCAL_CLONE=/app/git
mkdir -p $LOCAL_CLONE
if [ ! -d "$LOCAL_CLONE/.git" ]; then 
	git clone $GIT_REPOSITORY_URL $LOCAL_CLONE
fi

cd $LOCAL_CLONE && git pull > git.log
FRAMEWORKS=/usr/local/tomcat/work/Catalina/localhost/oxygen-xml-web-author/frameworks
mkdir -p $FRAMEWORKS
cp -a $LOCAL_CLONE/frameworks/* $FRAMEWORKS 

RESULT=`cat git.log`
echo "-------------------------"
echo $RESULT
echo "-------------------------"
ALREADY_UP_TO_DATE="Already up to date."

if [ "$RESULT" = "$ALREADY_UP_TO_DATE" ]; then
	echo "Nothing to do, all up to date."
else
	echo "Files changed, determine if the change is relevant for restart."	
	FRAMEWORK_CHANGES=$( grep -e "frameworks/" git.log )	
	if [ -n "$FRAMEWORK_CHANGES" ]; then
		echo "There are changes in the frameworks:"
		printf '%s\n' "$FRAMEWORK_CHANGES"
		IGNORABLE_FRAMEWORK_CHANGES=$( grep -E "frameworks/(.*?)\.(css|sch)" git.log )
		echo "Checking if the changed files are all ignorable."
		printf '%s\n' "$IGNORABLE_FRAMEWORK_CHANGES"			
		if [ "$FRAMEWORK_CHANGES" = "$IGNORABLE_FRAMEWORK_CHANGES" ]; then
			echo "All changes are ignorable, no restart needed."
		else
			echo "There are changes in the frameworks, restarting."
			/usr/local/tomcat/bin/shutdown.sh
		fi
	else
		echo "There are no changes in the frameworks, no restart needed."
	fi
fi
