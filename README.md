This repo builds a game of Bulls and Cows, which is a math based game similar to Mastermind.

The game works as follows:

A player competes against the computer, which generates a random 4 digit number of unique values.

If the player guesses any one of those numbers, then they receive a 'cow'. For example, if the computer's number is '1234',
and the player guessed '3421', then they receive 4 cows.

The player receives a bull if the numbers are in the same position as the computer's. For example, if the computer's number is '1234'
and the player guesses '1243', then they will receive 2 bulls and 4 cows, as they guessed all 4 numbers correctly, but only 2 in the
right place. The game ends when the player scores 4 bulls

The game is build in Ruby and tested with Rspec. 
