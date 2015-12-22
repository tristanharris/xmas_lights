require 'sinatra'
require 'sinatra/activerecord'
require './request'
require 'tilt/erb'

set :database, {adapter: "sqlite3", database: "dev.sqlite3"}

get '/' do
  @r = Request.find_or_initialize_by(ip: env['REMOTE_ADDR'])
  erb :form
end

post '/' do
  r = Request.find_or_initialize_by(ip: env['REMOTE_ADDR'])
  r.v1 = params[:v1]
  r.v2 = params[:v2]
  r.save!
  redirect to('/')
end

__END__

@@ form
<form method=post>
  <input type="range" name="v1" min="0" max="255" value="<%=@r.v1%>">
  <input type="range" name="v2" min="0" max="255" value="<%=@r.v2%>">
  <input type="submit">
</form>

