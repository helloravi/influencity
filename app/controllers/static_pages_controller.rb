class StaticPagesController < ApplicationController
  def index
  	graph = Koala::Facebook::API.new("CAACEdEose0cBAEwNV7izuU6mtBTZBaZBuXb7r2Wi09LWu1MHUZBdiwgd04rcet2f7IvEMATPymZAQGuOMVEWT7WE6eZCoaZCvdLTDl9fPhdUOZBTwMwHBJgmc8CuYsQZCQmPy7pudWRItnHNXQ7jMciImChxOLmAqzm0Q0SqIZCE8BHRtmbT4mGbdmr5dOidPAfEZD")
  	profile = graph.get_object("me")
  	@feed = graph.get_connections("me", "feed")
    # byebug
  	@feed.each do |post|
  		if post["from"]["id"]!="827195764043515"
		  	# byebug
        if !Post.find_by(postid: post["id"])
    			newpost = Post.new
    			newpost.postid = post["id"]
  		  	newpost.postidcontent = post
  		  	newpost.address = post["message"]
  		  	newpost.locality = "area(post)"
  		  	newpost.city = "city(post)"
  		  	newpost.problem = "problem(post)"
  		  	newpost.postvalidity = true
  		  	newpost.resolution = false
  		  	newpost.photo = post["picture"] ? post["picture"] : "does not exist"

  		  	newpost.save
        end


  		end

  	end

    @posts = Post.all
  end

  private
  	def address(post)
  		if post["ddress:"]
        index = post.index("ddress:")+"ddress:".length
        return post[index..-1]
      else
        return "Not provided"
  		end
  	end

    def area(post)
      if post["rea:"]
        index1 = post.index("rea:")+"rea:".length
        index2 = post.index("problem:")+"problem:".length
        compositepost = post[index1..index2]
        indexhash = compositepost.index("#")
        if indexhash.nil?
          return "Not provided"
        end
        return compositepost[0..indexhash-1]
      else
        return "Not provided"
      end
    end

    def city(post)

      if post["rea:"]
        index1 = post.index("rea:")+"rea:".length+
        index2 = post.index("problem:")+"problem:".length
        compositepost = post[index1..index2]
        indexhash = compositepost.index("#")
        if indexhash.nil?
          return "Not provided"
        end
        return compositepost[0..indexhash-1]
      else
        return "Not provided"
      end

      
    end

end
