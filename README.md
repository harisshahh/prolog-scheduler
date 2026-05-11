# Prolog Scheduler
## The Files
- scheduler.pl
 - The main scheduler logic

- facts1.pl
 - Small testing dataset

- facts2.pl
 - A larger testing dataset

## To run the program

Start SWI-Prolog:

swipl

Load files:
?- consult('facts1.pl).
?- consult('facts2.pl').

Run:
?- plan(P).