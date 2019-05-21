#time java -cp ../libs/jason-2.3.jar:bin/classes jason.infra.centralised.RunCentralisedMAS jason_stclaus.mas2j 2> x~

source $JASON_HOME/scripts/jason-setup
time java -cp $JASON_JAR:bin/classes jason.infra.centralised.RunCentralisedMAS jason_stclaus.mas2j 2> x~
