#!/bin/bash

EXERCISES=("Hand walk"
           "Hip crossover" \
           "Scorpion" \
           "Calf Stretch" \
           "Posture elbow raise" \
           "Inverted hamstring" \
           "Lateral lunges" \
           "Forward lunge with forearm to instep" \
           "Backward lunge with a twist" \
           "Drop-lunge" \
           "Lower back squat-to-stand")


DURATION=120
NEAR_DONE=20
REST=20

single_exercise () {
  echo "$1..."
  say "$1"
  sleep $((DURATION-NEAR_DONE))
  say "$NEAR_DONE more seconds"
  sleep $NEAR_DONE
  say "Done with that"
  sleep $REST

}

# Indices used for loop so stings echoed in their entirety
for ((i = 0; i < ${#EXERCISES[@]}; i++)); do
  single_exercise "${EXERCISES[$i]}" $DURATION
done
