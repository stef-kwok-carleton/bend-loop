def eprint(message: String) -> IO(u24):
  with IO:
    # Functions with a return type always need somewhere to return to, so the * <- pattern indicates
    # they return to the void, we throw the response away
    * <- IO/FS/write(IO/FS/STDERR, String/encode_utf8(message))
    * <- IO/FS/write(IO/FS/STDERR, String/encode_utf8("\n"))
    return wrap(0) 

def eventmax():
  return 4
  
def u24_to_string(num):
  if num == 0:
    return "0"
  else:
    return u24_to_string_acc(num, String/Nil)

def u24_to_string_acc(num, acc):
  if num == 0:
    return acc
  else:
    digit = num % 10
    char  = digit + 48 # ASCII shift for '0'
    return u24_to_string_acc(num / 10, String/Cons(char, acc))

def declareevent(num)->String:
  string = ("Checking event number " + u24_to_string(num))
  return string


def eventtree():
  bend index = 0:
    when index < eventmax():
      ps = Tree/Node{left: fork (index +1), right: Tree/Leaf {value:u24_to_string(index)}}
    else:
      ps = Tree/Leaf {value: "There are no more events"}
  return ps
  
def eventtreeprint():
  bend index = 0:
    when index < eventmax():
      ps = fork (index +1), eprint (declareevent(u24_to_string(index)))
    else:
      ps = eprint("There are no more events")
  return ps
  

def eattree(tree):
  fold tree:
    case Tree/Node:
      return tree.left + tree.right
    case Tree/Leaf:
      return tree.value

def control_loop(state: IO(u24)) -> IO(u24):
  with IO:
    * <- IO/print("Bend keeps giving me this garbage:\n")
    leaf <- eprint(eventtree)
    return control_loop(wrap(1))

def main() -> IO(u24):
  return 
  
  #{with IO:
    * <- IO/print(eattree(eventtree)) #control_loop(wrap(1))
    return wrap(0) #}