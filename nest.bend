eventmax = 2
loops = 2
pstring = " "


def eventloop():
  bend iteration = 0:
    when iteration < eventmax:
      bend index = 0:
        when index < loops:
          pstring = pstring + "This is where an event goes." + fork (index +1)
        else:
          pstring = pstring + "There are no more events"
      pstring = fork (iteration+1)
    else:
      pstring = pstring + "reached end of list"         
      
  return pstring
 
def main():
  return eventloop 