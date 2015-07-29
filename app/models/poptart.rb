class Poptart < ActiveRecord::Base

  def as_json(args = {})
    if args[:promotion] == 'halloween'
      {
          flavor: "Spooky #{flavor}",
          sprinkles: "Spooky #{sprinkles}"
      }
    else
      super
    end
  end
end
