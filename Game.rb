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
  
  def iterateP1Payload
    i = 0
    ary = []
    rowLength = getRowLength
    while i < rowLength
      ary << compareP1Payload(i)
      i += 1
    end
    ary
  end
  
  def iterateP2Payload
    i = 0
    ary = []
    colLength = getColLength
    while i < colLength
      ary << compareP2Payload(i)
      i += 1
    end
    ary
  end
  
  def compareP1Payload(row)
    rows = []
    r = 0
    rowLength = getRowLength
    while r < @payloadP1.length
      rows << @payloadP1[r + row]
      r += rowLength
    end
    rows
  end
  
  def compareP2Payload(col)
    cols = []
    r = 0
    colLength = getColLength
    while r < colLength
      cols << @payloadP2[r + (col * colLength)]
      r += 1
    end
    cols
  end
  
  def getMaxArrayofArrays(ary)
    maxAry = []
    ary.length.times do |i|
      max = ary[i].max
      maxAry << ary[i].find_index(max)
    end
    maxAry
  end
  
  def areItemsAllEqual(ary)
    ary.all? {|x| x == ary[0]}
  end
  
end
