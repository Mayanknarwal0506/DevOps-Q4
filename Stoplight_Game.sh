
# Stoplight Game: Simulates Nash Equilibrium in a stoplight decision scenario

# Define outcomes and their payoffs
# Payoff structure: (Player 1, Player 2)
# Both Stop: (1, 1)
# One Stops, One Goes: (0, 3) or (3, 0)
# Both Go (Crash): (-5, -5)

# Randomly generate decisions for two players (0 = Stop, 1 = Go)
player1=$((RANDOM % 2))
player2=$((RANDOM % 2))

# Display player choices (0: Stop, 1: Go)
echo "Player 1: $([[ $player1 -eq 0 ]] && echo 'Stop' || echo 'Go')"
echo "Player 2: $([[ $player2 -eq 0 ]] && echo 'Stop' || echo 'Go')"

# Determine outcomes based on choices
if [[ $player1 -eq 0 && $player2 -eq 0 ]]; then
    echo "Outcome: Both Stop (1, 1)"
elif [[ $player1 -eq 1 && $player2 -eq 0 ]]; then
    echo "Outcome: Player 1 Goes, Player 2 Stops (3, 0)"
elif [[ $player1 -eq 0 && $player2 -eq 1 ]]; then
    echo "Outcome: Player 1 Stops, Player 2 Goes (0, 3)"
else
    echo "Outcome: Both Go - Crash (-5, -5)"
fi


