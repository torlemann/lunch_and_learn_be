class TouristSightsSerializer
    include JSONAPI::Serializer
  
    set_id {nil}
    set_type "tourist_sight"
  
    attributes :name, :address, :place_id
end
