#time java -cp ../../jason-svn/lib/jason.jar:bin/classes jason.infra.centralised.RunCentralisedMAS fibonacci.mas2j
#java -Xmx4g  -Dprofile.properties=../jip.properties  -javaagent:../jip-1.2/profile/profile.jar  -cp ../../jason-svn/lib/jason.jar:bin/classes jason.infra.centralised.RunCentralisedMAS fibonacci.mas2j
#java -Xmx4g  -Dprofile.properties=../jip.properties  -javaagent:../jip-1.2/profile/profile.jar  -cp ~/bin/Jason-1.4.2/lib/jason.jar:bin/classes jason.infra.centralised.RunCentralisedMAS fibonacci.mas2j
#time java -cp ~/bin/Jason-1.4.2/lib/jason.jar:bin/classes jason.infra.centralised.RunCentralisedMAS fibonacci.mas2j
source $JASON_HOME/scripts/jason-setup
time java -cp "$JASON_HOME/libs/*":bin/classes jason.infra.local.RunLocalMAS fibonacci.mas2j
