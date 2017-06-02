#!/usr/bin/env bash
echo "hello world"

sudo apt-get update
ifconfig

cd /
cd /tmp/shared

sudo scp java.tar.gz ~/opt
sudo scp mavan.tar.gz ~/opt
sudo scp jenkins_2.1_all.deb ~/opt
sudo scp jira.bin ~/opt
cd /opt

#install java
sudo tar zxvf java.tar.gz
sudo update-alternatives --install /usr/bin/java java/opt/jdk1.8.0_45/bin/java 100
sudo update-alternatives --install /usr/bin/javac javac/opt/jdk1.8.0_45/bin/javac 100
sudo update-alternatives --config java

#install maven
sudo tar zxvf maven.tar.gz
sudo update-alternatives --install /usr/bin/mvn mvn /opt/apache-mavan-3.3.9/bin/mvn 100

#install git
sudo apt-get install -y git

#install jenkins
dpkg -i jenkins_2.7.4_all.deb
apt-get install -f -y
apt-get install -y jenkins
service jenkins start

#install jira
sudo chmod a+x jira.bin
sudo ./jira.bin <<EOF
o
1
2
8081
8006
i
EOF

java --version
mvn -v
git --version
sudo service jenkins status
ps -ef | grep JIRA
echo "Install Complete"