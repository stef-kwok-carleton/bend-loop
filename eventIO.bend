eventmax = 2
loops = 2
pstring = "string"


def eventloop():
  bend index = 0, iteration = 0:
    when index <= (eventmax) & iteration <= loops:
      if index < eventmax:
        pstring = pstring + ("This will execute event #" + index)+ fork (index + 1)
      else:
        pstring = pstring + ("End of events") + fork (iteration +1, index - eventmax)
    else:
      pstring = pstring + "reached end of list"
  return pstring
 
def main ()-> IO(u24):
  return eventloop 