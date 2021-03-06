#!/usr/bin/env bash

# Copyright 2019 The Goodrain Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

check_type="{{ pillar['install-type'] }}"

#Logfile=/tmp/.repo.$(date +%Y%m%d)
#Oldlogfile=/tmp/.repo.$(date +%Y%m%d --date='1 days ago')

if [ "$check_type" == "online" ];then
    curl -I -s  http://127.0.0.1:8081/artifactory/libs-release/ | head -1 | grep 200
    if [ "$?" -eq 0 ];then
        exit 0
    else
        exit 1
    fi
else
    #[ -f "$Oldlogfile" ] && rm -rf $Oldlogfile && touch $Logfile
    #[ -f "$Logfile" ] || && touch $Logfile
    curl -I -s  http://127.0.0.1:8081/artifactory/webapp/#/home | head -1 | grep 200
    if [ "$?" -eq 0 ];then
        exit 0
    else
        exit 1
    fi
fi