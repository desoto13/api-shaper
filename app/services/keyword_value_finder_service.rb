class KeywordValueFinderService
  def initialize(params, keyword)
    @params = params.to_unsafe_h
    @keyword = keyword
    @result_value = nil
  end

  def exec
    find_keyword_value(@params, @keyword)
    @result_value
  end

  private

  def find_keyword_value(params, keyword)
    if params.is_a?(Hash)
      params.each do |key, value|
        if key.to_s.include?(keyword)
          @result_value = value
          return
        end
        find_keyword_value(value, keyword)
      end
    elsif params.is_a?(Array)
      params.each { |element| find_keyword_value(element, keyword) }
    end
  end
end
