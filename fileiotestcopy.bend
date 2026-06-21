# Bend doesn't print to stderr, so I wrote my own function to do it
def eprint(message: String) -> IO(u24):
  with IO:
    # Functions with a return type always need somewhere to return to, so the * <- pattern indicates
    # they return to the void, we throw the response away
    * <- IO/FS/write(IO/FS/STDERR, String/encode_utf8(message))
    * <- IO/FS/write(IO/FS/STDERR, String/encode_utf8("\n"))
    return wrap(0) 

# Demonstration of I/O behaviour
def main() -> IO(u24): # IO(u24) means the return type of main is going to be an integer wrapped in the IO monad
  with IO: # All IO stuff needs to be contained in a with, with is essentially a functor into IO
    # Input returns a Result sum type, either Ok(val) or Err
    * <- IO/print("gimme filename: \n")
    file <- IO/input()
    match file:
      case Result/Ok:
        # read_file returns a Result sum type, either Ok(val) or Err
        name <- IO/FS/read_file(file.val)
        match name:
          case Result/Ok:
            # If it's an Ok, then it's a struct and there's a val inside, 
            # reading a file yields bytes so we decode
            contents = String/decode_utf8(name.val)
            * <- IO/print("Here's what was in your file: ")
            * <- IO/print(contents)
            * <- IO/print("\n")
            # Writing is the same, always remember to write bytes
            * <- IO/FS/write_file("outfile.txt", String/encode_utf8(contents))
            return wrap(0) # 0 means we did it hooray
          case Result/Err:
            * <- eprint("Error reading input file")
            return wrap(1) # 1 is an error code

      case Result/Err:
        * <- eprint("What the fuck did you type in the terminal")
        return wrap(0)
