module ResortsHelper

  def print_pic_base(resort_data_pic,resort_data_base,resort_units)
    if resort_data_pic.to_s.empty? or resort_data_base.to_s.empty?
      descr=''
    else
      descr=resort_data_pic.to_s
      descr+=' - '
      descr+=resort_data_base.to_s
      descr+=' '
      descr+=resort_units.to_s
    end
  end

  def print_with_meters(resort_data, resort_units)
    if resort_data.to_s.empty?
      descr=''
    else
      descr=resort_data.to_s
      descr+=' '
      descr+=resort_units.to_s
    end
  end

end
