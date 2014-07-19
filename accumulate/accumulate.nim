import strutils

proc accumulate*[T, S](data: seq[T], op: proc (x: T): S {.closure.}): seq[S] =
  newSeq(result, data.len)
  for i, v in data:
    result[i] = op(v)
