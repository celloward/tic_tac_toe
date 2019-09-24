
Rejigger the board to be 1D:
```
[1, 2, 3, 4, 5, 6, 7, 8, 9]
```

There are four checks:

# Check A:
1 == 2 == 3
4 == 5 == 6
7 == 8 == 9
For x in [1, (1 + 3), (1 + 3 + 3)]:
    return true if every `y == match` for y in [x, x + 1, x + 1 + 1]:
A: sequential?(…, 3, 1)

# Check B:

1 == 4 == 7
2 == 5 == 8
3 == 6 == 9
For x in [1, (1 + 1), (1 + 1 + 1)]:
  return true if every `y == match` for y in [x, x + 3, x + 3 + 3]
B: sequential?(…, 1, 3)

# Check C & D:
The diagonals; I don't think there's any shame in match == board[0] == board[4] == board[8] || match == board[2] == board[4] == board[6]


Write something like this:

```
def sequential?(board, match, outer_step, inner_step)
  for x in (
end
```

forget-ye-na that "all?" and "select" and such exist
Here are some true facts about Ruby:
> (1..9).step(3).to_a
=> [1, 4, 7]

# the 2 in there is (9 / 3) - 1 (i.e. board size divided by x's step, then that's off by one because math)
> (1..9).step(3).each do |x|
   (x..(x + 2)).each do |y|
     puts y
   end
   puts "---"
 end
1
2
3
---
4
5
6
---
7
8
9
---
=> 1..9






# Testing

it "does something" # with no block given

will make a pending test

xit "does something" do
  this_is_broken_code()
end

will also be pending

also also you can call `pending` from within a spec, something like

```
it "does something" do
  pending "waiting for _________ to happen"
  broken_code()
end
```
