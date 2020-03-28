defmodule Conditional do
  def _if(bool, fthen, felse) do
    if bool do
      fthen.()
    else
      felse.()
    end
  end
end
