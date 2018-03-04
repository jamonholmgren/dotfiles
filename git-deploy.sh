#!bin/bash

gitdeploy () {
  ABSPATH=$(cd "$(dirname "$0")"; pwd)

  echo "Git Deploy Setup Script"
  echo "=====  ==     =====  ======  =====   =====  ======  ======  ==  ==  ======"
  echo "==     ==     ==     ==  ==  ==  ==  ==       ==    ==      ==  ==    ==  "
  echo "==     ==     =====  ======  =====   =====    ==    ==  ==  ======    ==  "
  echo "==     ==     ==     ==  ==  ==  ==     ==    ==    ==   =  ==  ==    ==  "
  echo "=====  =====  =====  ==  ==  ==  ==  =====  ======  ======  ==  ==    ==  "
  echo ""
  echo "Jamon Holmgren"
  echo "Version 1.2 - 3/4/2018"
  echo ""
  echo "CONNECTING TO REMOTE SERVER"
  echo "====================================================================="
  echo "Enter the username and hostname of the remote server (e.g. user@server.com)"
  read REMOTE_SERVER
  echo ""

  echo "Enter the name of the remote folder (e.g. 'httpdocs' or sometimes 'sitename.com'):"
  read REMOTE_FOLDER
  echo ""

  echo ""
  # Create a temporary shell script to send to the remote server

  echo "#!bin/bash" > tempgitdeploysetup.sh
  echo "cd ~/$REMOTE_FOLDER" >> tempgitdeploysetup.sh
  echo "if [ ! -d 'deploy.git' ]; then" >> tempgitdeploysetup.sh
    echo "mkdir deploy.git && cd deploy.git" >> tempgitdeploysetup.sh
    echo "git init --bare" >> tempgitdeploysetup.sh
    echo "unlink hooks/post-receive" >> tempgitdeploysetup.sh
    echo "echo '#!/bin/sh' > hooks/post-receive" >> tempgitdeploysetup.sh
    echo "echo 'GIT_WORK_TREE=.. git checkout -f' >> hooks/post-receive" >> tempgitdeploysetup.sh
    echo "chmod +x hooks/post-receive" >> tempgitdeploysetup.sh
    echo "echo 'Options -Indexes' >> .htaccess" >> tempgitdeploysetup.sh
  echo "fi" >> tempgitdeploysetup.sh
  echo "if [ ! -d '~/.ssh' ]; then" >> tempgitdeploysetup.sh
    echo "mkdir ~/.ssh" >> tempgitdeploysetup.sh
  echo "fi" >> tempgitdeploysetup.sh
  echo "chmod 700 ~/.ssh" >> tempgitdeploysetup.sh
  echo "touch ~/.ssh/authorized_keys" >> tempgitdeploysetup.sh
  echo "chmod 644 ~/.ssh/authorized_keys" >> tempgitdeploysetup.sh
  
  echo "Piping shell script to $REMOTE_SERVER for setup."

  ssh $REMOTE_SERVER 'bash -s' < tempgitdeploysetup.sh

  # Remove the temp file
  rm tempgitdeploysetup.sh


  echo ""
  echo "UPLOADING YOUR SSH KEY"
  echo "====================================================================="
  echo ""


  # Set up remote SSH
  SSH_FILE="id_rsa"
  
  # Only use this if you want to create a new SSH key for each site
  # SSH_FILE=${REMOTE_SERVER//@/_}
  # SSH_FILE=${SSH_FILE//./_}

  cd ~
  cd .ssh/
  if [ ! -f "./$SSH_FILE.pub" ]; then
    echo ""
    echo "Generating new SSH file $SSH_FILE.pub."
    ssh-keygen -t rsa -f ./$SSH_FILE
  fi

  ssh -q -o "BatchMode=yes" $REMOTE_SERVER "echo 2>&1" \
    && echo "SSH already set up!" \
    || echo "Setting up SSH..."; cat ./$SSH_FILE.pub | ssh $REMOTE_SERVER 'cat >> .ssh/authorized_keys'


  echo ""
  cd $ABSPATH
  git remote rm live
  git remote add live $REMOTE_SERVER:$REMOTE_FOLDER/deploy.git

  echo ""
  echo "FINISHED"
  echo "====================================================================="
  echo ""
  echo "To deploy, just run 'git push live master'."
}