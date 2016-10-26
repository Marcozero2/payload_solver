# PayLoad Solver

Iterated elimination of dominated strategies (IEDS)

The iterated elimination (or deletion) of dominated strategies is one common technique for solving games that involves iteratively removing dominated strategies. In the first step, at most one dominated strategy is removed from the strategy space of each of the players since no rational player would ever play these strategies. This results in a new, smaller game. Some strategies—that were not dominated before—may be dominated in the smaller game. The first step is repeated, creating a new even smaller game, and so on. The process stops when no dominated strategy is found for any player. This process is valid since it is assumed that rationality among players is common knowledge, that is, each player knows that the rest of the players are rational, and each player knows that the rest of the players know that he knows that the rest of the players are rational, and so on ad infinitum.

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
A step by step series of examples that tell you have to get a development env running

Say what the step will be

```
Give the example
```

And repeat

```
until finished
```

End with an example of getting some data out of the system or using it for a little demo

## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone who's code was used
* Inspiration
* etc