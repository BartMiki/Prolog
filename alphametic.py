import argparse
import re
import itertools

def parse_term(term):
    if term.isdigit():
        return term
    
    mappings = {
        'Ż': 'Z1',
        'Ź': 'Z2',
        'Ć': 'C1',
        'Ą': 'A1',
        'Ś': 'S1',
        'Ę': 'E1',
        'Ł': 'L1',
        'Ó': 'O1',
        'Ń': 'N1'
    }
    return [mappings.get(letter, letter) for letter in term]

def split_calculation(expression):
    operators = ['+', '-', '*', '/', '^']
    for operator in operators:
        if operator in expression:
            return tuple(expression.split(operator) + [operator])

def make_product(exp):
    if isinstance(exp, str):
        return exp

    result = []
    for power, atom in enumerate(reversed(exp)):
        if power == 0:
            result.append(atom)
        else:
            result.append(f"{atom}*1{'0'*power}")

    result.reverse()
    return ' + '.join(result)

def make_calculation(exp1, exp2, operator):
    product = make_product(exp2)
    if operator == '^':
        product = f"({make_product(exp1)})"
        result = '* '
        powers = itertools.repeat(product, int(exp2) - 1)
        result += '*'.join(powers)
        return result
    else:
        return f"{operator} ({product})"

def make_sol(tokens):
    sol = [f"{token.lower()}:{token}" for token in tokens]
    sol = ', '.join(sol)
    return sol

def make_tokens(*exps):
    result = []
    for exp in exps:
        if isinstance(exp, list):
            result += exp
    
    return list(set(result))

def prolog_program(exp1, exp2, exp3, operator):
    exp1 = parse_term(exp1)
    exp2 = parse_term(exp2)
    exp3 = parse_term(exp3)
    tokens = make_tokens(exp1, exp2, exp3)
    program = f""":- use_module(library(clpfd)).

alpha(Sol) :-
    Vars = [{', '.join(tokens)}],
    Vars ins 0..9,
    {exp1[0]} #\= 0,
    {exp3[0]} #\= 0,
    Sol = sol({make_sol(tokens)}),
    all_different(Vars),
    ({make_product(exp1)}) {make_calculation(exp1, exp2, operator)} #= {make_product(exp3)},
    labeling([ff], Vars).
"""
    return program

def parse_sentence(sentence: str):
    tokens = sentence.replace(' ','').split('=')
    left, right = tuple(tokens)
    exp1, exp2, operator = split_calculation(left)

    program = prolog_program(exp1, exp2, right, operator)
    return program

def main(sentence):
    program = parse_sentence(sentence)
    with open('alpha.pl', 'w') as file:
        file.write(program)

if __name__ == "__main__":
    parser = argparse.ArgumentParser('alphametic')
    parser.add_argument('sentence', help='Sentence to parse as alphametic')
    args = parser.parse_args()

    main(args.sentence.upper())
    # main('BÓJKA * 6 = WYROK')
    # main('SEND + MORE=MONEY')
    # main('MROK ^ 2 = CIEMNOŚĆ')