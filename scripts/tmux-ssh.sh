#!/usr/bin/env bash
if [[ $# -eq 0 ]]; then
  # no arguments, we exit
  echo "no arguments provided"
  exit 0
fi

app=$1
env=$2

tmux neww -n $app
tmux selectw -t $app -n $app
# aws ec2 describe-instances --profile "$AWS_DEFAULT_PROFILE" --region "us-east-1" --output text \ 
# --query "Reservations[*].Instances[*].{Name:Tags[?Key==\`Name\`]|[0].Value,IP:PrivateIpAddress}" \ 
# --filters "Name=tag:Name,Values=*$app*" | awk {'print $1'} | xargs -I % tmux split ssh %

servers=`jws-grep $app $env | awk '{ print $2 }'` 

for i in $servers; do
  tmux splitw ssh $i
done
