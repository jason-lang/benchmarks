
# time java -cp ~/bin/Jason-1.4.2/lib/jason.jar:bin/classes jason.infra.centralised.RunCentralisedMAS ia_performance.mas2j
source $JASON_HOME/scripts/jason-setup
time java -cp "$JASON_HOME/libs/*":bin/classes jason.infra.local.RunLocalMAS ia_performance.mas2j
