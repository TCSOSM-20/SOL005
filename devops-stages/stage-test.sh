#!/bin/sh
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
specfiles=$(ls | egrep "^[^.]*.(json|yaml)")

fres=0
for i in $specfiles ; do
    echo "-- Validating and linting OpenAPI file $i..."
    swagger-cli validate "$i"
    res=$?
    speccy lint "$i" --skip openapi-tags-alphabetical
    res2=$?
    fres=$(($fres||$res||$res2))
    echo "--- Validator returned $res, linter returned $res2."
done

echo "-- Final validation returns $fres."

exit $fres

