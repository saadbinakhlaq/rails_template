module ProfilesHelper
  def border_error(error)
    error ? " border-red-500" : " border-gray-200"
  end
end
