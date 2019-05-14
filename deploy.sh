#!/bin/bash

declare -x project_name
echo "Enter project name: "
read project_name
echo "You entered: $project_name"
echo "Is this correct? (type y or n and return): "
read answer

function deployment {
ssh jtredway@bootcamp-coders.cnm.edu /bin/bash << ENDSSH
touch "/tmp/${project_name}"
cd public_html
mkdir "$project_name"
exit
ENDSSH
}

if [ "$answer" == "y" ]
then
  echo "Proceeding with deployment, please wait..."
  deployment
  echo "Deployment successful! $project_name deployed on CNM server."
  exit
else
  echo "Deployment terminated."
  exit
fi

echo "End of script"
