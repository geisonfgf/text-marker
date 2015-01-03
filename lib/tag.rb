require "textmarker/version"

module TextMarker
  class Tag
    attr_accessor :tag, :background_color, :text_color
    attr_reader :open_tag, :close_tag

    def initialize(tag=:span, background_color=:yellow, text_color=:black)
      @tag = tag
      @background_color = background_color
      @text_color = text_color

      @open_tag = generate_open_tag
      @close_tag = generate_close_tag
    end

    def to_s
      generate_open_tag + generate_close_tag
    end

    private
      def generate_open_tag
        "<#{@tag} style='background_color: #{@background_color}; color: #{@text_color}'>"
      end

      def generate_close_tag
        "</#{@tag}>"
      end
  end
end
