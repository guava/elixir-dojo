defmodule SpaceAge do
  def age_on(:earth, time) do
    time / 31557600
  end

  def age_on(:mercury, time) do
    age_on(:earth, time) / 0.2408467
  end

  def age_on(:venus, time) do
    age_on(:earth, time) / 0.61519726
  end

  def age_on(:mars, time) do
    age_on(:earth, time) / 1.8808158
  end

  def age_on(:jupiter, time) do
    age_on(:earth, time) / 11.862615
  end

  def age_on(:saturn, time) do
    age_on(:earth, time) / 29.447498
  end

  def age_on(:uranus, time) do
    age_on(:earth, time) / 84.016846
  end

  def age_on(:neptune, time) do
    age_on(:earth, time) / 164.79132
  end

  # def age_on(place, time) do
  #   earth_age = time / 31557600
  #
  #   case place do
  #     :earth ->
  #       earth_age
  #     :mercury ->
  #       earth_age / 0.2408467
  #     :venus ->
  #       earth_age / 0.61519726
  #     :mars ->
  #       earth_age / 1.8808158
  #     :jupiter ->
  #       earth_age / 11.862615
  #     :saturn ->
  #       earth_age / 29.447498
  #     :uranus ->
  #       earth_age / 84.016846
  #     :neptune ->
  #       earth_age / 164.79132
  #   end
  # end
end
