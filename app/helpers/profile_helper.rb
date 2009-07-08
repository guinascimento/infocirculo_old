module ProfileHelper

  def full_im
    case @profile.im_type
    when :MSN
      @profile.im + " (MSN)"
    when :AIM
      @profile.im + " (AIM)"
    when :GTalk
      @profile.im + " (GTalk)"
    when :Skype
      @profile.im + " (Skype)"
    end
  end

end
