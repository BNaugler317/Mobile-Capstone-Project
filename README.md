# Mobile Capstone Project – Sudoku App

## Overview

This project is a mobile Sudoku game developed as a capstone project. The goal is to create a Sudoku game application that focuses on game logic and usability rather than complex animations or visual effects.

The project was chosen because it provides a manageable scope while still presenting interesting programming challenges. The primary challenge is implementing and enforcing Sudoku rules, validating player input, and generating puzzles with different difficulty levels.

## Features

- Playable Sudoku puzzle board
- Selectable cells
- Number entry system
- Validation of Sudoku rules
- Detection of invalid moves
- Visual feedback for incorrect entries
- Multiple difficulty levels
- Puzzle generation system
- Mobile-friendly user interface

## How Sudoku Works

Sudoku is played on a 9×9 grid of small boxes which is further divied into nine 3×3 large boxes.

The objective is to fill every empty cell with a number from 1 to 9 while following these rules:

1. Each row must contain the numbers 1–9 exactly once.
2. Each column must contain the numbers 1–9 exactly once.
3. Each large 3×3 box must contain the numbers 1–9 exactly once.

The application will monitor rows, columns, and boxes to ensure the player does not make illegal moves. i.e duplicate numbers in the same box row or column.

## Difficulty System

Difficulty will be determined by the number of starting values provided in the puzzle.
(basic idea more starting numbers the easier the puzzel)

- Easy: More starting numbers
- Medium: Moderate number of starting numbers
- Hard: Fewer starting numbers

The fewer starting numbers a puzzle contains, the more difficult it becomes.

## Technical Challenges

The primary technical challenges include:

- Sudoku rule validation
- Puzzle generation ( I'm thinking the best approach might be develop a random puzzel generator that generates the entire puzzel and than substracts numbers to a starting point determine by difficulty)
- Difficulty balancing
- Detecting invalid moves (checking for duplicates)
- Managing game state
- Creating an intuitive mobile interface

## Project Goals

The main goal is to deliver a complete Sudoku application within the project timeline.

Additional goals include:

- Expanding gameplay features if time permits
- Improving the user experience
- Adding optional enhancements beyond the minimum requirements
- develop an Android version if time permits

## Future Enhancements

Potential future features include:

- Timer system
- Statistics tracking
- Hint system ( I think the player should get hint points by completing puzzels, if your struggling with a hard puzzel play some easy puzzels and accumulate hint points. hint points will carry accross puzzels.)
- Save and resume functionality
- Additional puzzle packs ( an example of this might be symboku replacing each number with a uniuque symbol the same basic rules of sudoku would apply no duplicate symbols per row column and box.)
- Achievement system (trophies, everyone loves trophies...)

## Author

Brandon Naugler
