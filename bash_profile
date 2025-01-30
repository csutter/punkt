# macOS is difficult/different in that executes `bash_profile` instead of `bashrc` on
# non-login shells. Sourcing bashrc here to mimic Linux behaviour:
if [ -r ~/.bashrc ]; then
   source ~/.bashrc
fi
