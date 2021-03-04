FROM node:12

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  libgconf-2-4 \
  apt-utils \
  wget \
  curl \
  git \
  fonts-ipafont-gothic \
  fonts-wqy-zenhei \
  fonts-thai-tlwg \
  fonts-kacst \
  ttf-freefont \
  fonts-liberation \
  libappindicator3-1 \
  libasound2 \
  libatk-bridge2.0-0 \
  libatk1.0-0 \
  libcups2 \
  libgtk-3-0 \
  libnspr4 \
  libnss3 \
  libx11-xcb1 \
  libxss1 \
  libxtst6 \
  lsb-release \
  xdg-utils \
  \
  && rm -rf /var/lib/apt/lists/*

RUN yarn global add element-cli

WORKDIR /code

COPY package.json .
COPY yarn.lock .
RUN yarn install
COPY . .
CMD ["element", "run", "./element-docker-test.perf.ts", "--no-sandbox"]
