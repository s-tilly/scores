#!/usr/bin/env python

from string import Template
import argparse
import os
import shlex
import subprocess

ut =     { 'transposition': 'c',    'prefix': 'Ut', 'tonality': 'Ut' }
b_flat = { 'transposition': 'd', 'prefix': 'Bb', 'tonality': 'Bb' }
e_flat = { 'transposition': 'a,', 'prefix': 'Eb', 'tonality': 'Eb' }

def argument_parser():
    parser = argparse.ArgumentParser(description="Lilypond wrapper")
    parser.add_argument('ly_filename', help="The Lilypond template to parse")
    parser.add_argument('-b', '--bflat', required=False, default=False, action='store_true', dest='b_flat', help='Output in Bb')
    parser.add_argument('-u', '--ut', required=False, default=False, action='store_true', dest='ut', help='Ouput in Ut')
    parser.add_argument('-e', '--eflat', required=False, default=False, action='store_true', dest='e_flat', help='Ouput in Eb')
    parser.add_argument('-f', '--full', required=False, default=False, action='store_true', dest='full', help='Make all scores')
    parser.add_argument('-d', '--debug', required=False, default=False, action='store_true', dest='debug', help='Keep output file after lilypond usage')
    return parser.parse_args()

def generate_input(filename, variables):
    out_filename = '{}_{}'.format(variables['prefix'], filename)
    with open(filename, 'r') as f:
        src = Template(f.read())
        out = src.safe_substitute(variables)
    with open(out_filename, 'w') as f:
        f.write(out)
    return out_filename

def run(command, debug=False):
    """Run shell command
    On retourne le code retour de la fonction, stdout et stderr dans
    une liste (et dans cet ordre)
    """
    args = shlex.split(command)
    p = subprocess.Popen(args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    stdout, stderr = p.communicate()
    if debug:
        print()
        print('command: ', command)
        print('Return code :', p.poll())
        print('stdout:\n', stdout)
        print('stderr:\n', stderr)
        sys.stdout.flush()
    return p.poll(), stdout, stderr

def call_lilypond(filename):
    r, out, err = run('lilypond {}'.format(filename))
    print(out.decode("utf-8"))
    print(err.decode("utf-8"))

if __name__ == '__main__':
    args = argument_parser()

    if args.full:
        args.ut = args.e_flat = args.b_flat = True

    # if ut = Ok or no option are passed
    if args.ut or not (args.e_flat or args.b_flat):
        filename = generate_input(filename=args.ly_filename, variables=ut)
        call_lilypond(filename)
        if not args.debug:
            os.remove(filename)

    if args.e_flat:
        filename = generate_input(filename=args.ly_filename, variables=e_flat)
        call_lilypond(filename)
        if not args.debug:
            os.remove(filename)

    if args.b_flat:
        filename = generate_input(filename=args.ly_filename, variables=b_flat)
        call_lilypond(filename)
        if not args.debug:
            os.remove(filename)
