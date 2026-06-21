#eprint copied from Eilene's code
def eprint(message: String) -> IO(u24):
  with IO:
    # Functions with a return type always need somewhere to return to, so the * <- pattern indicates
    # they return to the void, we throw the response away
    * <- IO/FS/write(IO/FS/STDERR, String/encode_utf8(message))
    * <- IO/FS/write(IO/FS/STDERR, String/encode_utf8("\n"))
    return wrap(0) 



def eventloop():
  eventmax = 2
  loops = 2
  pstring = " "
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
 
def main() -> IO(u24):
  return eprint (eventloop)
  