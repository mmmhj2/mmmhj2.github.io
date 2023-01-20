#!/bin/bash

source /etc/profile
source ~/.profile
source ~/.bashrc

export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

echo "Running Jekyll Serve"
bundle exec jekyll serve --drafts
