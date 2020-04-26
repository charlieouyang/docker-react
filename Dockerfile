# first build phase
from node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

# /app/build will have all of the result build files
RUN npm run build


# second phase
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

# no need to RUN or CMD.. nginx starts by itself
