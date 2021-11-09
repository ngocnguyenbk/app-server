class NonAccentVietnamese
  def initialize(str)
    @str = str
  end

  def call
    text = str.downcase
    text = text.gsub(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/, "a")
    text = text.gsub(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/, "e")
    text = text.gsub(/ì|í|ị|ỉ|ĩ/, "i")
    text = text.gsub(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/, "o")
    text = text.gsub(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/, "u")
    text = text.gsub(/ỳ|ý|ỵ|ỷ|ỹ/, "y")
    text = text.gsub(/đ/, "d")
    # Some system encode vietnamese combining accent as individual utf-8 characters
    text = text.gsub(/\u0300|\u0301|\u0303|\u0309|\u0323/, "") # Huyền sắc hỏi ngã nặng
    text = text.gsub(/\u02C6|\u0306|\u031B/, "") # Â, Ê, Ă, Ơ, Ư
    text
  end

  private

  attr_reader :str
end
