class UserSerializer 
    include JSONAPI::Serializer 
  
    set_type "user"
  
    attributes :email, :name, :api_key
  end