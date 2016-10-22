#!/usr/bin/ruby

class Game
  
  attr_accessor :player
  
  def initialize(ary)
    @ary = ary
    @player = 1
  end
  
  def changePlayer
    @player = (@player % 2) + 1
  end
  
  def compareTo(a, b)
    return a - b
  end
  
  def getPlayer1Payload
    payloadAry = []
    @ary.each { |row|
      row.each { |col|
        payloadAry << col[0]
      }
  }
  payloadAry
  end
  
  def getPlayer2Payload
      payloadAry = []
      @ary.each { |row|
        row.each { |col|
          payloadAry << col[1]
        }
    }
  payloadAry
  end
end