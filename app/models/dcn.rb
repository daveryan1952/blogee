class dcn < ActiveRecord::Base
  for column in Posts.columns
    put column.name
  end
  
  for column in Comments.columns
    put column.name
  end
end
