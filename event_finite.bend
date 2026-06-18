eventmax = 2
loops = 2
pstring = "string"


def eventloop():
  bend index = 0:
    when index <= (eventmax * loops):
      pstring = ("This will execute event #" + index), fork (index + 1)
    else:
      pstring = "reached end of list"
  return pstring
  
def main ():
  return eventloop
  #print(pstring)