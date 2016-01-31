This repo builds a game of Bulls and Cows, which is a math based game similar to Mastermind.

The game works as follows:

A player competes against the computer, which generates a random 4 digit number of unique values.

If the player guesses any one of those numbers, then they receive a 'cow'. For example, if the computer's number is '1234',
and the player guessed '3421', then they receive 4 cows.

The player receives a bull if the numbers are in the same position as the computer's. For example, if the computer's number is '1234'
and the player guesses '1243', then they will receive 2 bulls and 4 cows, as they guessed all 4 numbers correctly, but only 2 in the
right place. The game ends when the player scores 4 bulls

The game is built in Ruby, tested with Rspec, and deployed with Rails.

## Why Rails

I decided to use Rails for this because it was much easier setting up a database and user authentication with the Devise gem.
I wanted to have a leadership board, where users high scores are saved into the database for other users to compete against, and
the most efficient way to achieve this was through using Rails, PostgreSQL, ActiveRecord and Devise.

## What Needs Improving

The front end design is not yet complete. In fact it's rather disgusting. Most of my efforts go into back-end functionality as
that's what I enjoy most, so I didn't want to get caught up in the front end too much. It's still a work in progress, however,
and I'll improve the layout and design over time. 

## Setting up
```
git clone https://github.com/Adrian1707/bulls_and_cows
cd bulls_and_cows
bundle install
rails s
visit localhost:3000
Get Playing!
```

## Tests Tests Tests

```
Set up first (see above)
rspec
```
