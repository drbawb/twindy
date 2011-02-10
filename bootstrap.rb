require "bundler/setup"
Bundler.require

set :environment, :development

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/blog.db")

class Post
    include DataMapper::Resource
    property :id, Serial
    property :title, String
    property :created_at, DateTime
end

# automatically create the post table
Post.auto_migrate!

get '/' do
  haml :index
end