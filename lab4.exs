defmodule Lab4 do
  def interpolationSearch(target, list) do
    startIndex = 0
    lastIndex = tuple_size(list)-1
    interpolationSearch(target, list, startIndex, lastIndex)


  end

  def interpolationSearch(target, list, startIndex, lastIndex) do
    if (elem(list, startIndex) == elem(list, lastIndex)) do
      if (elem(list, startIndex) == target) do
        return = startIndex

      else
        retrun = -1
      end
    else
      if ((startIndex <= lastIndex) && (target >= elem(list, startIndex)) && (target <= elem(list, lastIndex))) do
        pos = startIndex + (div((lastIndex - startIndex), (elem(list, lastIndex) - elem(list, startIndex))) * (target - elem(list, startIndex)))
        if (elem(list, pos)==target) do
          return = pos
          #IO.inspect pos

        else
          if (elem(list, pos) < target) do
            startIndex = pos + 1
            interpolationSearch(target, list, startIndex, lastIndex)
          else
            lastIndex = pos - 1
            interpolationSearch(target, list, startIndex, lastIndex)
          end

        end

      else
        return =-1
      end
    end
  end

end
IO.inspect Lab4.interpolationSearch(30, {1, 4, 7, 9, 9, 12, 13, 17, 19, 21, 24, 32, 36, 44, 45, 54, 55, 63, 66, 70})
