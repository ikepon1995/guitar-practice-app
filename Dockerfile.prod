FROM ruby:3.1.4

ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

# 必要なライブラリをインストール
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# アプリケーションディレクトリを作成
WORKDIR /app

# Gemfile類をコピーして本番用にインストール
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --without development test

# アプリケーションのコードをコピー
COPY . .


# ポート解放
EXPOSE 3000

# サーバー起動
CMD ["bash", "-c", "bundle exec rails assets:precompile && rails server -b 0.0.0.0 -e production"]
