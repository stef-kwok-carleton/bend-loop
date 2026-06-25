#eprint copied from Eilene's code
def eprint(message: String) -> IO(u24):
  with IO:    * <- IO/FS/write(IO/FS/STDERR, String/encode_utf8(message))
    * <- IO/FS/write(IO/FS/STDERR, String/encode_utf8("\n"))
    return wrap(0) 

def eventmax ():
  return 2

def loops ():
  return 2
  
def eventcreate():
  bend index = 0:
    when index < eventmax:
      ps = Tree/Node{left: fork (index +1), right: Tree/Leaf {value: "Checking Event"}}
    else:
      ps = Tree/Leaf {value: "There are no more events"}
  return ps

def loopcreate():
  bend iteration = 0:
    when iteration < loops:
      pstring = Tree/Node {left: fork (iteration+1), right: (eventcreate())}  
    else:
      pstring =  Tree/Leaf {value: "reached end of loops"}         
      
  return pstring
  
def eventloop (tree):
  fold tree:
    case Tree/Node:
      return tree.left + tree.right
    case Tree/Leaf:
      return tree.value
  
 
def main() -> IO(u24):
  return eprint (eventloop (loopcreate))
  