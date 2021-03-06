# PayLoad Solver

Iterated elimination of dominated strategies (IEDS)

The iterated elimination (or deletion) of dominated strategies is one common technique for solving games that involves iteratively removing dominated strategies. In the first step, at most one dominated strategy is removed from the strategy space of each of the players since no rational player would ever play these strategies. This results in a new, smaller game. Some strategies�that were not dominated before�may be dominated in the smaller game. The first step is repeated, creating a new even smaller game, and so on. The process stops when no dominated strategy is found for any player. This process is valid since it is assumed that rationality among players is common knowledge, that is, each player knows that the rest of the players are rational, and each player knows that the rest of the players know that he knows that the rest of the players are rational, and so on ad infinitum.

There are two versions of this process. One version involves only eliminating strictly dominated strategies. If, after completing this process, there is only one strategy for each player remaining, that strategy set is the unique Nash equilibrium.

Another version involves eliminating both strictly and weakly dominated strategies. If, at the end of the process, there is a single strategy for each player, this strategy set is also a Nash equilibrium. However, unlike the first process, elimination of weakly dominated strategies may eliminate some Nash equilibria. As a result, the Nash equilibrium found by eliminating weakly dominated strategies may not be the only Nash equilibrium. (In some games, if we remove weakly dominated strategies in a different order, we may end up with a different Nash equilibrium.)

In any case, if by iterated elimination of dominated strategies there is only one strategy left for each player, the game is called a dominance-solvable game.

https://en.wikipedia.org/wiki/Strategic_dominance

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

Ruby 2.3.1 
https://www.ruby-lang.org/en/documentation/installation/


### Installing

Clone or Download script from https://github.com/acevedog/payload_solver

## Running the tests

ruby GameTest.rb
