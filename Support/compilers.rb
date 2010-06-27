require 'plist'

class TMPlist

  def self.compile hsh
    new(hsh).compile
  end

  def initialize hsh
    @hsh = hsh
  end

  def compile
    @hsh.to_plist
  end
end

class TMGrammar < TMPlist

  def compile
    trailing_dots_to_scope_name!
    extended_regexps!
    super
  end

  # finds names that look like:
  #   comment.line.number-sign.
  # and appends the scope_name:
  #   comment.line.number-sign.tm-grammar-yaml
  def trailing_dots_to_scope_name!
    @hsh = self.class.tdtsn @hsh, scope_name
  end

  # tm-grammar-yaml for source.tm-grammar-yaml
  def scope_name
    @hsh['scopeName'].split('.').last
  end

  NAME_KEYS = %w(name contentName)

  def self.tdtsn(obj, scope_name)
    case obj
    when Hash
      obj.each do |key,val|
        if NAME_KEYS.include?(key) && val[-1] == ?.
          obj[key] = val + scope_name
        end
        tdtsn(val, scope_name)
      end
    when Array
      obj.each { |val| tdtsn(val, scope_name) }
    else
      return
    end
  end

  # Prepends "(?x)" (the sequence that turns on extended mode in onigurama
  # regexps) to all regexes in the grammar
  def extended_regexps!
    @hsh = self.class.er(@hsh)
  end

  REGEXP_KEYS = %w(
  foldingStartMarker foldingStopMarker
  match begin end)

  def self.er(obj)
    case obj
    when Hash
      obj.each do |key,val|
        obj[key] = '(?x)'+val if REGEXP_KEYS.include?(key)
        er(val)
      end
    when Array
      obj.each { |val| er(val) }
    end
  end

end

def compile_tm_plist(data,target_name)
  case target_name
  when /Syntaxes/ then TMGrammar
  else TMPlist
  end.compile(data)
end
