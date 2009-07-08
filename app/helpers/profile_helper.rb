module ProfileHelper

  def full_im
    if @profile.im_type == 1
      @profile.im + " (MSN)"
    end
  end

end
