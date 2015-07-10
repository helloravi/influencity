class StaticPagesController < ApplicationController
  def index
  	graph = Koala::Facebook::API.new("CAACEdEose0cBACtsbTCHMayFgq8nGOAAqpiC5ZAcRgzybpJcZAqc5vDpgvUF77fLQMw8lJrYPMPiWQ8cbCN2GkgksoLTHAEcfQv9OpxIYxjoscwPL5pQH2QT4nMccxPgxbPWdagcdbrGLHrvDfWRQn05rzDVKP1prTY7rZC8QXiUZCxU0nPT3ZAyCbR2dZAydNV8poawcP3QZDZD")
  	profile = graph.get_object("me")
  	feed = graph.get_connections("me", "feed")
  	byebug
  end

end
