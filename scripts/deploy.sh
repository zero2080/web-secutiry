#!/bin/bash

REPOSITORY=/home/ec2-user/app/step2

echo "> Build 파일 복사"

cp $REPOSITORY/zip/*.war  ~/apache-tomcat-8.5.72/webapps/

echo "> 새 어플리케이션 배포"
