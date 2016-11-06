#!/usr/bin/env python

from baluhn import generate, verify
import os
import sys

value = sys.argv[1]

print generate(value)
