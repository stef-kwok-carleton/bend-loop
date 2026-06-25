def address ():
  return "test.txt"

def control_loop(state: IO(u24)):
  with IO:
    * <- IO/print("Bend keeps giving me this garbage:\n")
    op <- IO/FS/open(address, "r")
    outputlist <- IO/FS/read_file(address)
    * <- IO/print((String/decode_utf8(Result/unwrap(outputlist))))
    * <- IO/print("\n")
    return control_loop(wrap(1))

def main():
  with IO:
    return control_loop(wrap(1))