module ProfileHelper

  def full_im
    if @profile.im_type == 1
      @profile.im + " (MSN)"
    end
  end

  def maritial_status
    if @profile.maritial_status == 1
      "Solteiro"
    end
  end

end
