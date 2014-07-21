import
  strutils, tables

proc transform*(scoreTable: TTable[int, seq[string]]): TTable[string, int] =
  result = initTable[string, int]()
  for score, letters in scoreTable:
    for letter in letters:
      result[toLower(letter)] = score
