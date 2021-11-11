# This script installs the AWS CLI to perform backup to S3 properly. The default integration to backup on AW S3 does not work well...

# Go to a folder where you have lots of space to write (the root of the mounted drive)
cd /mnt/HD/HD_a2/

# Create a temporary folder to install things
mkdir tmp
cd tmp

# Download the last version of AWS CLI that is compatible with python 2.7 (which is installed on WD Mycloud Mirror)
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle-1.19.112.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip

# Create another temp directory where python will expand things
mkdir tmp
export TMPDIR=/mnt/HD/HD_a2/tmp/tmp

# start the installation process with switches to install on the drive with space
cd awscli-bundle
./install -i /mnt/HD/HD_a2/tmp/awscli -b /mnt/HD/HD_a2/tmp/aws

/mnt/HD/HD_a2/tmp/aws s3 sync ./ bucket://
