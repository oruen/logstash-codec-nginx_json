# encoding: utf-8
require "logstash/codecs/json"

class LogStash::Codecs::NginxJson < LogStash::Codecs::JSON
  config_name "nginx_json"

  # http://www.codetable.net/hex/e3
  UNESCAPES = {
      'a' => "\x07", 'b' => "\x08", 't' => "\x09",
      'n' => "\x0a", 'v' => "\x0b", 'f' => "\x0c",
      'r' => "\x0d", 'e' => "\x1b", "\\\\" => "\x5c",
      "\"" => "\x22", "'" => "\x27", 'ñ' => "\xf1",
      '®' => "\xae", 'Ã' => "\xc3", 'Ö' => "\xd6",
      'á' => "\xe1", 'ã' => "\xe3", 'é' => "\xe9",
      'ó' => "\xf3", 'ý' => "\xfd"
  }

  def unescape(str)
    # Escape all the things
    str.gsub(/\\(?:([#{UNESCAPES.keys.join}])|u([\da-fA-F]{4}))|\\0?x([\da-fA-F]{2})/) {
      if $1
        if $1 == '\\' then '\\' else UNESCAPES[$1] end
      elsif $2 # escape \u0000 unicode
        ["#$2".hex].pack('U*')
      elsif $3 # escape \0xff or \xff
        [$3].pack('H2')
      end
    }
  end

  public
  def decode(data)
    data = unescape(data)
    super(data)
  end
end
