#C:\Users\stef_\OneDrive\Documents\
address = "text.txt"
#def IO/FS/open(address)

def main():
  with IO:
    op <- IO/FS/open("text.txt", "a+")
    #* <- IO/print("sup")
    butt <- IO/FS/read_file(op)
    * <- IO/print(butt)
    return wrap(0)