class NSObject
  attr_accessor :motion_wiretap_observers

  def wiretap(property, &block)
    MotionWiretap::WiretapKvo.new(self, property, &block)
  end

end


class NSArray

  def wiretap(property=nil, &block)
    raise "`wiretap` is not supported on Arrays (arrays are not observable).  You probably meant to use `wiretaps`."
  end

  def wiretaps(&block)
    MotionWiretap::WiretapArray.new(self, &block)
  end

end


class Proc

  def wiretap(queue=nil, &block)
    MotionWiretap::WiretapProc(queue, &block)
  end

end
