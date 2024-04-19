# ベースイメージとしてRubyを指定
FROM ruby:3.1.4

# Node.jsのバージョンを指定
ARG NODE_VERSION=14
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
# Node.jsおよびyarnパッケージのインストール
RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - \
    && apt-get update -qq \
    && apt-get install -y build-essential nodejs \
    && npm install -g yarn

# 作業ディレクトリの設定
WORKDIR /app

# GemfileとGemfile.lockをコピーし、bundle installを実行
COPY Gemfile Gemfile.lock ./
RUN gem install bundler:2.2.29 && bundle install

# yarn.lockをコピーし、yarn installを実行
COPY yarn.lock ./
RUN yarn install

# アプリケーションのファイルをコピー
COPY . .

# サーバーの起動
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
