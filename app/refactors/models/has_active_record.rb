module Models
  module HasActiveRecord
    def normalize(object_or_id)
      return object_or_id if object_or_id.is_a? self
      return _from_record(object_or_id) if object_or_id.is_a? _record_model
      _load_from_record object_or_id
    end

    def error_model=(error_model)
      @_error_model = error_model
    end

    def record_model=(record_model)
      @_record_model = record_model
    end

    private
    def _load_from_record(id)
      record = _record_model.find_by_id id
      return _error_model.from_404 if record.nil?
      _from_record record
    end

    def _error_model
      return @_error_model unless @_error_model.nil?
      throw "Implement Me!"
    end

    def _record_model
      return @_record_model unless @_record_model.nil?
      throw "Implement Me!"
    end

    def _from_record(record)
      throw "Implement Me!"
    end
  end
end