require "textmarker/version"

module TextMarker
  class Tag
    attr_reader :tag, :open_tag, :close_tag, :background_color, :text_color

    def initialize(tag=:span, background_color=:yellow, text_color=:black)
      @valid_tags = get_valid_html_tags

      validate_tag(tag)
      validate_color(background_color)
      validate_color(text_color)

      @tag = tag
      @background_color = background_color
      @text_color = text_color

      @open_tag = generate_open_tag
      @close_tag = generate_close_tag
    end

    def to_s
      generate_open_tag + generate_close_tag
    end

    def tag=(tag)
      validate_tag(tag)
      @tag = tag
    end

    def background_color=(background_color)
      validate_color(background_color)
      @background_color = background_color
    end

    def text_color=(text_color)
      validate_color(text_color)
      @text_color = text_color
    end

    protected

      def get_valid_html_tags
        Set.new [:h1, :h2, :h3, :h4, :h5, :h6, :span, :div, :p, :a, :button, :center, :strong, :u, :b, :i]
      end

    private

      def validate_tag(tag)
        exception_error_message = ":tag must be one of these html tags "\
                                 ":h1, :h2, :h3, :h4, :h5, :h6, :span, :div, "\
                                 ":p, :a, :button, :center, :strong, :u, :b, :i"
        raise(ArgumentError, exception_error_message) unless is_html_tag_valid? tag
      end

      def validate_color(color)
        array_colors = [:aqua, :black, :blue, :fuchsia, :gray, :green, :lime, :maroon, :navy, :olive, :orange, :purple, :red, :silver, :teal, :white, :yellow]
        exception_error_message = "The color must be a css color value like #ffffff or one of these standard colors "\
                                 ":aqua, :black, :blue, :fuchsia, :gray, :green, :lime, :maroon, :navy, :olive, "\
                                 ":orange, :purple, :red, :silver, :teal, :white, :yellow"
        raise(ArgumentError, exception_error_message) if not array_colors.include? color and color.match(/#([a-fA-F0-9]){3}(([a-fA-F0-9]){3})?\b/).nil?
      end

      def is_html_tag_valid?(tag)
        @valid_tags.include? tag
      end

      def generate_open_tag
        "<#{@tag} style='background_color: #{@background_color}; color: #{@text_color};'>"
      end

      def generate_close_tag
        "</#{@tag}>"
      end
  end
end
