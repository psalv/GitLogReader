
USER = `git config user.name`.rstrip

# Simple file IO to read each line of a file
def fileIO
  data = []
  File.open('gitlog.txt', 'r').each_line {|line| data.push(line)}
  data
end


# Searching only for git log entries that contain the USER as their author.
def specializedFileIO
  data = []
  throwaway = true
  File.open('gitlog.txt', 'r').each_line do |line|
    splitLine = line.split[0, 2]
    if splitLine[0] == 'Author:'
      if splitLine[1] != USER
        throwaway = true
      else
        throwaway = false
      end
    end

    if !throwaway
      data.push line
    end
  end
  data
end

def printDataInReverse(data)
  current = previous = data.length - 1
  newData = []
  while current >= 0
    if data[current][0, 7] == 'Author:'
      i = current
      newData.push data[i] while (i = i + 1) <= previous
      previous = current - 1
    end
    current -= 1
  end
  newData
end


def groupByType(data)
  newData = []
  File.open('knowntasks', 'r').each_line do |line|
    line = line.rstrip

    if ARGV.length != 0
      if line != ARGV[0]
        next
      end
    end

    pos = 0
    adding = false

    while pos < data.length
      cur = data[pos].split[0, 2]
      if cur[0] == 'time'
        if cur[1] == line
          adding = true
        else
          adding = false
        end
      else
        if cur[0] == 'commit'
          pos = pos + 1
          next
        end
      end

      if adding
        newData.push data[pos]
      end

      pos = pos + 1

    end
  end

  newData
end


puts groupByType printDataInReverse specializedFileIO
