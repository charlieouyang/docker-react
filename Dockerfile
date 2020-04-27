# first build phase
from node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
# /app/build will have all of the result build files
RUN npm run build


# second phase
FROM nginx
# Need to expose port 80 on AWS app
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html

# no need to RUN or CMD.. nginx starts by itself
