 # /bin/bash

yarn build

aws s3 cp /Users/kimsurin/Desktop/vue_study/MovieFrontend/movie-frontend/dist/ s3://movie-frontend --recursive --grant read=uri=http://acs.amazonaws.com/groups/global/AllUsers --profile surin
