def main:
  my_list = []
  match my_list:
    case List/Cons:
      return my_list.head
    case List/Nil:
      return 0