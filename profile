function append_to_path {
  echo $PATH | grep -q -s $1
  if [ $? -eq 1 ] ; then
      PATH=$PATH:$1
      export PATH
  fi
}

function prepend_to_path {
  echo $PATH | grep -q -s $1
  if [ $? -eq 1 ] ; then
      PATH=$1:$PATH
      export PATH
  fi
}

export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home"
export ANDROID_HOME="/Users/mat/Library/Android/sdk"
export NODE_OPTIONS="--max_old_space_size=1024"
export PATH="$PATH:$HOME/.rvm/bin"
export LC_ALL=de_CH.UTF-8
export LANG=de_CH.UTF-8
export GNUTERM=x11

[[ -s "<%= ENV['HOME'] %>/.rvm/scripts/rvm" ]] && source "<%= ENV['HOME'] %>/.rvm/scripts/rvm"

prepend_to_path $HOME/.rvm/bin
prepend_to_path /usr/local/bin
prepend_to_path /usr/local/sbin
prepend_to_path /usr/local/share/npm/bin
