require_relative"Game"

ary = [[[0,1],[2,3],[1,20]], [[2,3],[1,1],[3,20]], [[1,1],[5,20],[2,20]]]
game = Game.new(ary)
game.stronglyReduceArray
p game.ary 

ary = [[[0,1],[2,3],[1,20]], [[2,3],[1,1],[3,20]], [[1,1],[5,20],[2,20]]]
game = Game.new(ary)
game.weaklyReduceArray
p game.ary 

ary = [[[0,1],[3,1],[5,1]], [[4,1],[2,1],[0,1]], [[-1,1],[-1,1],[-1,1]]]
game = Game.new(ary)
game.stronglyReduceArray
p game.ary

ary = [[[0,1],[3,1],[5,1]], [[4,1],[2,1],[0,1]], [[-1,1],[-1,1],[-1,1]]]
game = Game.new(ary)
game.weaklyReduceArray
p game.ary