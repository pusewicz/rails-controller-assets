require 'rails_helper'

RSpec.describe 'Precompiling assets' do
  let(:posts_stylesheets) do
    Dir[Rails.root.join('public/assets/posts-*.css')]
  end

  let(:posts_javascripts) do
    Dir[Rails.root.join('public/assets/posts-*.js')]
  end

  let(:comments_stylesheets) do
    Dir[Rails.root.join('public/assets/comments_index-*.css')]
  end

  let(:comments_javascripts) do
    Dir[Rails.root.join('public/assets/comments_index-*.js')]
  end

  before(:all) do
    task = Sprockets::Rails::Task.new(Rails.application)
    task.manifest.clobber
    task.manifest.compile(task.assets)
  end

  it 'precompilers controller stylesheets' do
    expect(posts_stylesheets.size).to eq(1)
    expect(File.read(posts_stylesheets.first)).to eq("body#posts {}\n")

    expect(comments_stylesheets.size).to eq(1)
    expect(File.read(comments_stylesheets.first)).to eq("body#comments-index {}\n")
  end

  it 'precompilers controller javascripts' do
    expect(posts_javascripts.size).to eq(1)
    expect(File.read(posts_javascripts.first)).to eq("Posts = function() {};\n")

    expect(comments_javascripts.size).to eq(1)
    expect(File.read(comments_javascripts.first)).to eq("CommentsIndex = function() {};\n")
  end
end
