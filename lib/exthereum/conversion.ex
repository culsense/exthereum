defmodule Exthereum.Conversion do
require IEx

alias Exthereum.Units
  @units %Units{}
  #@spec wei_to_eth(Integer.t) :: Float.t
  def wei_to_eth(wei) do
    wei / @units.eth
  end

end