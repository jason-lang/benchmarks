#!/bin/zsh
# run:
#          ./run-er.sh 2> data-er.csv
TIMEFMT=$'%*U'
for i in {1..150..5}
do
  echo "n($i)." | cat > n.asl
  for j in {1..5}
  do
    echo -n $i, >&2
    time java -cp "$JASON_HOME/libs/*":bin/classes jason.infra.local.RunLocalMAS cnp-er.mas2j
  done
done
