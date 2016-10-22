#!/usr/bin/ruby

class Game
  
  attr_accessor :player
  
  def initialize(ary)
    @ary = ary
    @player = 1
    @payloadP1 = getPlayer1Payload
    @payloadP2 = getPlayer2Payload
  end
  
  def changePlayer
    @player = (@player % 2) + 1
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
  
  def compareTo(a, b)
    return a - b
  end
  
  def lessThan(a, b)
    if compareTo(a, b) < 0
      return true
    end
    false
  end
  
  def equals(a, b)
    if compareTo(a, b) == 0
      return true
    end
    false
  end
  
  def getRowLength
    @ary.length
  end
  
  def getColLength
    @ary[0].length
  end
  
  def isPlayer1StronglyDominated
    
  end
  
end
