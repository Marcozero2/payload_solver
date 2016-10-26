#!/usr/bin/ruby

class Game
  
  attr_reader :player
  attr_reader :ary
  attr_reader :payloadP1
  attr_reader :payloadP2
  
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
  
  def areItemsAllEqual(ary)
    ary.all? {|x| x == ary[0]}
  end
  
  def isRowIndexStronglyDominated(index)
    ary = iterateP2Payload
    ary.length.times do |i|
      item = ary[i][index]
      if ary[i].max == item 
        return false
      end
    end
    true
  end
  
def isRowIndexWeaklyDominated(index)
    ary = iterateP2Payload
    ary.length.times do |i|
      item = ary[i][index]
      max = ary[i].max
      if ary == item || ary[i].count(max) > 1
        return false
      end
    end
    true
  end
  
  def isColIndexStronglyDominated(index)
    ary = iterateP1Payload
    ary.length.times do |i|
      item = ary[i][index]
      if ary[i].max == item 
        return false
      end
    end
    true
  end
  
  def isColIndexWeaklyDominated(index)
    ary = iterateP1Payload
    ary.length.times do |i|
      item = ary[i][index]
      max = ary[i].max
      if ary == item || ary[i].count(max) > 1
        return false
      end
    end
    true
  end
  
  def removeRowIndex(index)
    @ary.delete_at(index)
    @payloadP1 = getPlayer1Payload
    @payloadP2 = getPlayer2Payload
  end
  
  def removeColIndex(index)
    @ary.length.times do |i|
      @ary[i].delete_at(index)
    end
    @payloadP1 = getPlayer1Payload
    @payloadP2 = getPlayer2Payload
  end
  
  def reduceP1Array
    count = 0
    @ary.length.times do |i|
      if (isRowIndexStronglyDominated(i) == true) 
        removeRowIndex(i)
        puts "Removed row #{i} "
        count = 1
      end
    end
    if (count == 0)
      p1 = true
    else
      p1 = false
    end
    p1
  end
  
  def reduceP2Array
    count = 0
    @ary.length.times do |i|
      if (isColIndexStronglyDominated(i) == true) 
        removeColIndex(i)
        puts "Removed col #{i} "
        count = 1
      end
    end
    if (count == 0)
      p2 = true
    else
      p2 = false
    end
    p2
  end

  
  def reduceP1ArrayWeakly
    count = 0
    @ary.length.times do |i|
      if (isRowIndexWeaklyDominated(i) == true) 
        removeRowIndex(i)
        puts "Removed row #{i} "
        count = 1
      end
    end
    if (count == 0)
      p1 = true
    else
      p1 = false
    end
    p1
  end
  
  def reduceP2ArrayWeakly
    count = 0
    @ary.length.times do |i|
      if (isColIndexWeaklyDominated(i) == true) 
        removeColIndex(i)
        puts "Removed col #{i} "
        count = 1
      end
    end
    if (count == 0)
      p2 = true
    else
      p2 = false
    end
    p2
  end
  
  def stronglyReduceArray
    p1 = false
    p2 = false
    while (p1 != true && p2 != true)
      p1 = reduceP1Array
      p2 = reduceP2Array
    end
  end
  
  def weaklyReduceArray
    p1 = false
    p2 = false
    while (p1 != true && p2 != true)
      p1 = reduceP1ArrayWeakly
      p2 = reduceP2ArrayWeakly
    end
  end
end

ary = ARGV.first
game.new(argv)