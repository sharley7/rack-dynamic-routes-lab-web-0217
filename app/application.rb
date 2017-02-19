class Application

  @@items = []

  def call (env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_input = req.path.split("/items/").last
      if item = @@items.find do | x |
                x.name == item_input
                end
          resp.write item.price
        else
         resp.write "Item not found"
         resp.status = 400
        end

    else
       resp.write "Route not found"
       resp.status = 404
    end
    resp.finish
  end

end
