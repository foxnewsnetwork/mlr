module Models
  module HasActiveRecord
    mattr_accessor :error_model, :record_model
    DefaultErrorSentence = lambda do |name|
      "Expected to find #{name} but could not. You can either set the value for the model or implement the method yourself!"
    end
    def normalize(object_or_id)
      return object_or_id if object_or_id.is_a? self
      return _from_record(object_or_id) if object_or_id.is_a? _record_model
      _load_from_record object_or_id
    end

    private
    def _load_from_record(id)
      record = _record_model.find_by_id id
      return _error_model.from_404 if record.nil?
      _from_record record
    end

    def _error_model
      return error_model unless error_model.nil?
      begin
        self.const_get "Error"
      rescue NameError => e
        raise NotImplementedError.new DefaultErrorSentence.call self.to_s.concat "::Error"
      end
    end

    def _record_model
      return record_model unless record_model.nil?
      begin
        self.const_get "Record"
      rescue NameError => e
        raise NotImplementedError.new DefaultErrorSentence.call self.to_s.concat "::Record"
      end
    end

    def _from_record(record)
      raise NotImplementedError.new("You must implement a way to take the activerecord instance #{record} to an object")
    end
  end
end