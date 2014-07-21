import
  tables, unittest
import etl

test "transform one value":
  let
    input = toTable(@[(1, @["A"])])
    transformed = transform(input)
    expected = toTable(@[("a", 1)])
  check transformed == expected

test "transform multiple keys from one value":
  let
    input = toTable(@[(1, @["A", "E"])])
    transformed = transform(input)
    expected = toTable(@[("a", 1), ("e", 1)])
  check transformed == expected

test "transform multiple keys from multiple values":
  let
    input = toTable(@[(1, @["A"]), (4, @["B"])])
    transformed = transform(input)
    expected = toTable(@[("a", 1), ("b", 4)])
  check transformed == expected

test "lowercase input":
  let
    input = toTable(@[(1, @["a"]), (4, @["b"])])
    transformed = transform(input)
    expected = toTable(@[("a", 1), ("b", 4)])
  check transformed == expected

test "full dataset":
  let
    input = toTable(@[
      (2, @["D", "G"]),
      (1, @["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"]),
      (3, @["B", "C", "M", "P"]),
      (4, @["F", "H", "V", "W", "Y"]),
      (5, @["K"]),
      (8, @["J", "X"]),
      (10, @["Q", "Z"])])
    transformed = transform(input)
    expected = toTable(@[
      ("a", 1), ("b", 3), ("c", 3), ("d", 2), ("e", 1), ("f", 4), ("g", 2),
      ("h", 4), ("i", 1), ("j", 8), ("k", 5), ("l", 1), ("m", 3), ("n", 1),
      ("o", 1), ("p", 3), ("q", 10), ("r", 1), ("s", 1), ("t", 1), ("u", 1),
      ("v", 4), ("w", 4), ("x", 8), ("y", 4), ("z", 10)])
  check transformed == expected
