eventmax = 5
pstring = "string"


def eventloop():
  bend index = 0,temp =0:
    when index <= eventmax & temp <3:
      if index < eventmax:
        pstring = ("This will execute event #" + index), fork (index + 1)
      else:
        pstring = ("reached end of event list, restarting"), fork (index - eventmax, temp +1)
    else:
      pstring = "reached end of list"
  return pstring
  
def main ():
  return eventloop
  #print(pstring)