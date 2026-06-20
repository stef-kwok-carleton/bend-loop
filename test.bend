def sum(tree):
  fold tree:
    case Tree/Node:
      return tree.left + tree.right
    case Tree/Leaf:
      return tree.value

def treemaker():
  bend x = 0:
    when x < 3:
      tree = Tree/Node { left: fork(x + 1), right: fork(x + 1) }
    else:
      tree = Tree/Leaf { value: 7 }
  return tree

def notmain(tree):
  nottree = Tree/Node {
    left: Tree/Node { left: Tree/Leaf { value: 1 }, right: Tree/Leaf { value: 2 } },
    right: Tree/Node { left: Tree/Leaf { value: 3 }, right: Tree/Leaf { value: 4 } }
  }
  return sum(tree)
  

  
def notbreak:
  bend d = 0, i = 0:
    when d < 8:
      sum = Tree/Node {left: fork(d+1, i*2+0), right: fork(d+1, i*2+1)}
    else:
      sum = Tree/Leaf {value: i}
  return sum  
  
def break():
  bend d = 0, i = 0:
    when d < 8:
      sum = fork(d+1, i*2+0) + fork(d+1, i*2+1)
    else:
      sum = i
  return sum

def halting():
  bend l = 0:
    when l >= 0:
      arbitrary = fork (l+1)
    else:
      arbitrary = 1
  return arbitrary

def bendy ():
  bend index = 0:
    when index < 2:
      pstring =  "This is where an event goes." + fork (index +1)
    else:
      pstring = "There are no more events"
  return pstring

def main:
  return bendy