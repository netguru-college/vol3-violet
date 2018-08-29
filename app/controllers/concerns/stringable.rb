module Stringable extend ActiveSupport::Concern

  def split_on_white_space(whole_string)
    whole_string.strip.split(" ")
  end
end