#time java -cp ../jason-agere13.jar:bin/classes jason.infra.centralised.RunCentralisedMAS jason_stclaus.mas2j
#time java -cp ~/bin/Jason-1.4.2/lib/jason.jar:bin/classes jason.infra.centralised.RunCentralisedMAS jason_stclaus.mas2j
source $JASON_HOME/scripts/jason-setup
time java -cp $JASON_JAR:bin/classes jason.infra.centralised.RunCentralisedMAS jason_stclaus.mas2j 2> x~
