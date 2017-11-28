class Feedback < ApplicationRecord
  belongs_to :ratable, polymorphic: true

  def as_json(options={})
    super(except: [:id, :timestamps])
  end

end
