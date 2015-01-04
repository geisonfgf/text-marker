require "textmarker/version"

module TextMarker
  class Marker
    attr_accessor :text

    def initialize(text="")
      @text = text
    end

    def mark_all_ocurrence_of(snippet_to_be_marked, tag=Tag.new)
      @text.gsub(snippet_to_be_marked, build_marked_snippet(snippet_to_be_marked, tag))
    end

    def mark_first_ocurrence_of(snippet_to_be_marked, tag=Tag.new)
      @text.sub(snippet_to_be_marked, build_marked_snippet(snippet_to_be_marked, tag))
    end

    private

      def build_marked_snippet(snippet_to_be_marked, tag)
        tag.open_tag + snippet_to_be_marked + tag.close_tag
      end
  end
end
