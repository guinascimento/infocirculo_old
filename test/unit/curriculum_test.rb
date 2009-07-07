require 'test_helper'

class CurriculumTest < ActiveSupport::TestCase

  def test_should_be_invalid
    curriculum = Curriculum.create
    assert_invalid curriculum, "User should not be created"
  end

  def test_create_curriculum
    curriculum = Curriculum.create(
                    :summary => "teste",
                    :phone => "123456",
                    :im => "teste@hotmail.com",
                    :im_type => 1,
                    :address => "teste",
                    :birthday => "12/03/2000",
                    :maritial_status => 1,
                    :country => 1,
                    :school_name => "teste",
                    :degree => 1,

                    :activities => "teste",
                    :additional_notes => "teste",
                    :company_name => "teste",
                    :title => "teste",

                    :description => "teste")
    assert curriculum.valid?
    assert curriculum.save                
  end

  def test_create_duplicated_curriculum
    curriculum = Curriculum.create(
                    :summary => "teste",
                    :phone => "123456",
                    :im => "teste@hotmail.com",
                    :im_type => 1,
                    :address => "teste",
                    :birthday => "12/03/2000",
                    :maritial_status => 1,
                    :country => 1,
                    :school_name => "teste",
                    :degree => 1,

                    :activities => "teste",
                    :additional_notes => "teste",
                    :company_name => "teste",
                    :title => "teste",

                    :description => "teste")
    !assert curriculum.valid?
  end

end
