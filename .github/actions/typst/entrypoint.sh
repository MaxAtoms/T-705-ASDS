#!/bin/sh -l

mkdir -p /github/workspace
typst compile main.typ /github/workspace/main.pdf
