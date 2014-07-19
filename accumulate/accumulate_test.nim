from strutils import toUpper
import accumulate

proc square(n: int): int = n*n

let empty: seq[int] = @[]
doAssert(empty.accumulate(square) == empty, "empty seq")

doAssert(@[1, 2, 3].accumulate(square) == @[1, 4, 9], "square numbers")

doAssert(@["hello", "world"].accumulate(toUpper) == @["HELLO", "WORLD"], "toUpper some words")
