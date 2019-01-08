#!/bin/bash
set -e
locale-gen "en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
cat <<EOT >> /etc/environment
LC_ALL="en_US.UTF-8"
EOT
cd /IncludeOS
export INCLUDEOS_ENABLE_TEST=ON
export INCLUDEOS_PREFIX=/usr/local
export PATH=$PATH:$INCLUDEOS_PREFIX/includeos/bin
export CC="clang-5.0"
export CXX="clang++-5.0"
echo "Y" | ./install.sh
cat <<EOT >> /etc/environment
INCLUDEOS_PREFIX=/usr/local
CC="clang-5.0"
CXX="clang++-5.0"
EOT
cat <<EOT >> /etc/profile

PATH=$PATH:$INCLUDEOS_PREFIX/includeos/bin
EOT
pip install --upgrade pip
pip install subprocess32
