#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
# implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This Dockerfile is intented for devops and deb package generation

FROM ubuntu:18.04

RUN apt-get update && apt-get install -y git build-essential nodejs npm
RUN npm install -g swagger-cli
RUN npm install -g speccy

